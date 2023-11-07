import 'dart:convert';
import 'package:book_reader/model/book_model.dart';
import 'package:book_reader/model/universal_data.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<UniversalData> getAllData() async {
    Uri uri = Uri.parse('link');
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => BookModel.fromJson(e))
                    .toString() ??
                []);
      }
      return UniversalData(error: 'ERROR');
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  
  }
}
