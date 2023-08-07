import 'package:book_reader/model/book_model.dart';
import 'package:hive/hive.dart';

class LocalDatabase {

  static Future<void> openBoxBooks() async {
    await Hive.openBox<BookModel>('fileBox');
  }

  // Function to save a file path in Hive
  static saveFilePath(BookModel fileModel) async {
    var fileBox = await Hive.openBox<BookModel>('fileBox');
    await fileBox.add(fileModel);
  }

// Function to get all file paths from Hive
  static Future<List<BookModel>> getAllFiles() async {
    var fileBox = await Hive.openBox<BookModel>('fileBox');
    return fileBox.values.toList();
  }
}