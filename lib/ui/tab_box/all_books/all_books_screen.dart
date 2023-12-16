import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import '../../../data/db/local_db.dart';
import '../../../model/book_model.dart';
import '../home/widgets/pdfFile.dart';

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
                            onTap: () {
                              openPDF(context, books[index].path);
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

Future<void> openPDF(BuildContext context, String file) async {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PdfFile(file: file)),
  );
}

