import 'package:book_reader/model/book_model.dart';
import 'package:book_reader/model/universal_data.dart';
import 'package:book_reader/network/api_provider.dart';

class ApiRepository {
  final ApiProvider apiProvider;
  ApiRepository({required this.apiProvider});

  Future<List<BookModel>> fetchBookModelData() async {
    UniversalData universalData = await apiProvider.getAllData();
    if (universalData.error.isEmpty) {
      return universalData as List<BookModel>;
    }
    return [];
  }
}
