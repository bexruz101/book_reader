import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import '../../../data/db/local_db.dart';
import '../../../model/book_model.dart';
import '../home/widgets/pdfFile.dart';
import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class AllBooksScreen extends StatefulWidget {
  const AllBooksScreen({super.key});

  @override
  State<AllBooksScreen> createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {

   Future<void> clearData(int index) async {
    var fileBox = await Hive.openBox<BookModel>('fileBox');
    await fileBox.deleteAt(index);
    setState(() {});
  }

    getNumberOfPages(String filePath) async {
     // Load the PDF file
     final file = File(filePath);
     final pdfDocument =  PdfDocument.fromBase64String(file.path);
     final pages = pdfDocument.pages;
     return pages;
   }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('All_Books'),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        elevation: 0,
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
                  ? ListView.builder(
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
                            onTap: ()async {
                              int numbers = await getNumberOfPages(books[index].path);
                              openPDF(context, books[index].path,numbers);
                            },
                          ),
                        );
                      },
                    )
                  : Center(child: Text('EMPTYY'));
            }
          },
        ),
    );
  }
}

Future<void> openPDF(BuildContext context, String file,int bookLength) async {
  final extractor = PdfTextExtractor(PdfDocument.fromBase64String(file));
  final document = await PdfDocument.fromBase64String(file);

  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) =>  PdfScreen(bookPath: file, bookPages: bookLength, extractor: extractor, document: document)),
  );
}

