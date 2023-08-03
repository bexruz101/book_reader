import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfFile extends StatefulWidget {
  const PdfFile({super.key, required this.path});
  final String path;

  @override
  State<PdfFile> createState() => _PdfFileState();
}

class _PdfFileState extends State<PdfFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.file(File(widget.path)),
    );
  }
}
