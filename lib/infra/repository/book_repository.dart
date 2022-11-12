import '../api/api.dart';

class BookRepository {
  Future<dynamic> getBooks({int page = 0}) async {
    try {
      return await http.get(
        Uri.parse(Api.baseUrl + 'volumes?q=\$searchItem&startIndex=$page'),
      );
    } catch (e) {
      return e.toString();
    }
  }
}
