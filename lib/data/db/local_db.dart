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

  static Future<void> saveBool(String key, bool value) async {
    var boolBox = await Hive.openBox<bool>('boolBox');
    await boolBox.put(key, value);
  }

  static Future<bool?> getBool(String key, {bool? defaultValue}) async {
    var boolBox = await Hive.openBox<bool>('boolBox');
    return boolBox.get(key, defaultValue: defaultValue);
  }

  static Future<void> saveVocab(String key, List<Map<String, dynamic>>  value1,) async {
    var stringBox = await Hive.openBox<List<Map<String, dynamic>> >('stringBox');
    await stringBox.put(key, value1);

  }

  // Function to get two strings from Hive
  static Future<List<Map<String, dynamic>>> getVocabList(String key) async {
    var stringBox = await Hive.openBox<List<Map<String, dynamic>>>('stringBox');
    final List<Map<String, dynamic>>? values = stringBox.get(key) ;
    return values ?? [];
  }
}
