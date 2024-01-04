import 'dart:io';
import 'package:book_reader/utils/ui_utils/error_message_dialog.dart';
import 'package:book_reader/utils/ui_utils/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../../data/db/local_db.dart';
import 'send_to_chatgpt.dart';

class PdfFile extends StatefulWidget {
  const PdfFile({
    super.key,
    required this.file,
  });

  final String file;

  @override
  State<PdfFile> createState() => _PdfFileState();
}

class _PdfFileState extends State<PdfFile> {
  late PdfViewerController _pdfViewerController;
  OverlayEntry? _overlayEntry;
  String? chatGptResponse;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    _overlayEntry;
    super.initState();
  }

  Future<void> _saveStrings({required List<String> val}) async {
    List<Map<String, dynamic>> oldTxt = await LocalDatabase.getVocabList('key') ;
    oldTxt.add({oldTxt.length.toString():[val[0],val[1]]});
    await LocalDatabase.saveVocab('key', oldTxt);
    print('Strings saved successfully!');
  }


  Future<void> _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) async {
    final OverlayState _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 60,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: ElevatedButton(
          child:  Text('Extract',
              style: TextStyle(fontSize: 10, color: Colors.black)),
          onPressed: () async {
            showLoading(context: context);
            if (details.selectedText != null ) {
              try {
                 chatGptResponse = await getChatGptResponse(details.selectedText!);
                 Navigator.pop(context);
                showModalBottomSheet(context: context, builder: (BuildContext context) {
                  _saveStrings(val: [details.selectedText!,chatGptResponse!]);
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    child: Text("${details.selectedText!} = $chatGptResponse"),
                  );
                }
                );
              } catch (error) {
                showErrorMessage(message: error.toString(), context: context);
              } finally {
                _pdfViewerController.clearSelection();
                if (_overlayEntry != null) {
                  _overlayEntry!.remove();
                  _overlayEntry = null;
                }
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            elevation: 0,
          ),
        ),
      ),
    );
    _overlayState.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 1)),
          builder: (context, snapshot) {
            return SfPdfViewer.file(
              File(widget.file),
              onTextSelectionChanged:
                  (PdfTextSelectionChangedDetails details) async {
                if (details.selectedText == null && _overlayEntry != null) {
                  _overlayEntry!.remove();
                  _overlayEntry = null;
                } else if (details.selectedText != null &&
                    _overlayEntry == null) {
                    _showContextMenu(context, details);
                }
              },
              controller: _pdfViewerController,
            );
          },
        ));
  }
}
