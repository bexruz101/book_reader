import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    _overlayEntry;
    super.initState();
  }


  Future<void> _showContextMenu(BuildContext context,PdfTextSelectionChangedDetails details) async{
    final OverlayState _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 60,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child:
        ElevatedButton(
          child:  Text('Extract', style: TextStyle(fontSize: 10,color: Colors.black)),
          onPressed: () {
            _pdfViewerController.clearSelection();
            print(details.selectedText);
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
        title: Text(''),
      ),
      body: SfPdfViewer.file(
         File(widget.file),
        onTextSelectionChanged:
            (PdfTextSelectionChangedDetails details) async{
          if (details.selectedText == null && _overlayEntry != null) {
            _overlayEntry!.remove();
            _overlayEntry = null;
          } else if (details.selectedText != null && _overlayEntry == null) {
            _showContextMenu(context, details);
          }
        },
        controller: _pdfViewerController,
      ),
    );
  }
}
