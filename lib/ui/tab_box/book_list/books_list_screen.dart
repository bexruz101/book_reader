import 'dart:io';
import 'package:book_reader/data/shared_pref/local_db.dart';
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

  List<String?> file  = [];

  @override
  void initState() {
    file;
    requestFileAccessPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            file = await FilePickerr.pickFiles();
            final result = await FilePicker.platform.pickFiles(
                type: FileType.custom, allowedExtensions: ['pdf'], allowMultiple: true);
            setState(() {

            });
          print('PATHSSSS NOWWW:$file');
        },
      ),
      body: Center(
        child: Column(
          children: file.isNotEmpty?List.generate(file.length, (index) => ListTile(
            title: Text(file[index]!),
            onTap: (){
              openPDF(context, file[index] as String);
            },
        )):[Text('EMPTY$file'),]
        ),
      ),
    );
  }

  void openPDF(BuildContext context, String file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PdfFile(file: file)),
      );

  Files(List<String?> files){
    if(files.isNotEmpty)
    return files;
    else{
      return [];
    }
  }

  Future<File> saveFilePerm(PlatformFile file) async{
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.path}');
    return File(file.path!).copy(newFile.path);
  }


}
