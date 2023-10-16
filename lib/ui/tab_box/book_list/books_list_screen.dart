import 'dart:io';
import 'package:book_reader/data/db/local_db.dart';
import 'package:book_reader/ui/tab_box/book_list/widgets/pdfFile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../../model/book_model.dart';

class BooksListScreen extends StatefulWidget {
  const BooksListScreen({super.key});

  @override
  State<BooksListScreen> createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  late Box<BookModel> _fileBox;
  List<BookModel> files = [];

  Future<void> _loadFiles() async {
    _fileBox = await Hive.openBox<BookModel>('fileBox');
    setState(() {
      files = _fileBox.values.toList();
    });
  }

  Future<void> clearData(int index) async {
    var fileBox = await Hive.openBox<BookModel>('fileBox');
    await fileBox.deleteAt(index);
    setState(() {});
  }

  @override
  void initState() {
    _loadFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(tr('Home'),style: Theme.of(context).textTheme.titleLarge,),
        elevation: 0,
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await FilePicker.platform
                .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
            if (result == null) return;
            final file = result.files.first;
            openPDF(context, file.path!);
            LocalDatabase.saveFilePath(BookModel(
                id: 0,
                extension: file.extension!,
                size: file.size,
                name: file.name,
                path: file.path!));
            _loadFiles();
          },
          child:const Icon(Icons.upload),
        ),
        body: FutureBuilder<List<BookModel>>(
          future: LocalDatabase.getAllFiles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(tr('Error_load_data')),
              );
            } else {
              final books = snapshot.data ?? [];
              return books.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          startActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (v) {
                                  setState(() {
                                    clearData(index);
                                  });
                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                              )
                            ],
                          ),
                          child: ListTile(
                            title: Text(books[index].name),
                            subtitle: Text('${books[index].size}'),
                            trailing: Text(books[index].extension),
                            onTap: () {
                              openPDF(context, books[index].path);
                            },
                          ),
                        );
                      },
                    )
                  : Center(child: Text('EMPTY'));
            }
          },
        ));
  }

  Future<void> openPDF(BuildContext context, String file) async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PdfFile(file: file)),
    );
  }

  Future<File> saveFilePerm(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.path}');
    return File(file.path!).copy(newFile.path);
  }
}
