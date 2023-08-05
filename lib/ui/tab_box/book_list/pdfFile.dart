import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
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
   PdfViewerController? controller;
  int pages = 0;
  int indexPage = 0;

  @override
  void initState() {

    controller;
    pages;
    indexPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
        ],
      ),
      body: SfPdfViewer.file(
       File(widget.file,),
        canShowPageLoadingIndicator:false,
      ),
    );
  }



}

// appBar: AppBar(
//   title: Text(name),
//   actions: pages >= 2
//       ? [
//           Center(child: Text(text)),
//           IconButton(
//             icon: Icon(Icons.chevron_left, size: 32),
//             onPressed: () {
//               final page = indexPage == 0 ? pages : indexPage - 1;
//               controller!.jumpToPage(page);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.chevron_right, size: 32),
//             onPressed: () {
//               final page = indexPage == pages - 1 ? 0 : indexPage + 1;
//               controller!.jumpToPage(page);
//             },
//           ),
//         ]
//       : null,
// ),