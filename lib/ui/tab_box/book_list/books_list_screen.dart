import 'dart:io';
import 'package:book_reader/ui/tab_box/book_list/pdfFile.dart';
import 'package:book_reader/ui/tab_box/book_list/widgets/file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class BooksListScreen extends StatefulWidget {
  const BooksListScreen({super.key});

  @override
  State<BooksListScreen> createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  Future<void> requestFileAccessPermission() async {
    if (await Permission.storage.request().isGranted) {
    } else {}
  }

  @override
  void initState() {
    requestFileAccessPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final file = await FilePickerr.pickFiles();
          if (file == null) return;
          openPDF(context, file);
          final newFile = await saveFilePerm(file as PlatformFile);

        },
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PdfFile(file: file)),
      );

  Future<File> saveFilePerm(PlatformFile file) async{
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.path}');

    return File(file.path!).copy(newFile.path);

  }
}
