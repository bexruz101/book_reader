// import 'dart:io';
// import 'package:book_reader/data/shared_pref/local_db.dart';
// import 'package:book_reader/ui/tab_box/book_list/pdfFile.dart';
// import 'package:book_reader/ui/tab_box/book_list/widgets/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class BooksListScreen extends StatefulWidget {
//   const BooksListScreen({super.key});
//
//   @override
//   State<BooksListScreen> createState() => _BooksListScreenState();
// }
//
// class _BooksListScreenState extends State<BooksListScreen> {
//
//
//   Future<void> requestFileAccessPermission() async{
//     if(await Permission.storage.request().isGranted){
//     }else{
//     }
//   }
//   @override
//   void initState() {
//     requestFileAccessPermission();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.upload),
//           onPressed: () async {
//             requestFileAccessPermission();
//             List<String>? filePaths = await FilePickerWid.pickFiles();
//             print('PATHS:${filePaths}');
//             if (filePaths != null && filePaths.isNotEmpty) {
//               StorageRepository.putList('file_paths', filePaths);
//             }
//             setState(() {
//             });
//           },
//         ),
//         body: FutureBuilder<List<String>>(
//           future: getFiles(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               List<String> filePaths = snapshot.data ?? [];
//               return ListView.builder(
//                 itemCount: filePaths.length,
//                 itemBuilder: (context, index) => ListTile(
//                   title: Text(filePaths[index]),
//                   onTap: ()=>PdfFile(path: filePaths[index]),
//                 ),
//               );
//             }
//           },
//         )
//     );
//   }
//
//   Future<List<String>> getFiles() async {
//     return await StorageRepository.getList('file_paths');
//   }
//
//   void openFile(String filePath) async {
//     final result = await OpenFile.open(filePath);
//     if (result.type == ResultType.done) {
//       print('File opened successfully');
//     } else {
//       print('Error opening file: ${result.message}');
//     }
//   }
//
// }
