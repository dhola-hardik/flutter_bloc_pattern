import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_pattern/infra/models/book_response_model.dart';
import 'package:http/http.dart' as http;

import '../api/api.dart';

class BookRepository {
  Future<BookResponseModel> getBooks({String? search, int page = 0}) async {
    try {
      String url = '${Api.baseUrl}/volumes?q=$search&startIndex=$page';
      final result = await http.get(Uri.parse(url));
      return BookResponseModel.success(data: jsonDecode(result.body));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return BookResponseModel.error(error: e);
    }
  }
}
