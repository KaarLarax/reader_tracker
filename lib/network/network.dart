import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:http/http.dart' as http;

class Network {
  // api endpoint
  static String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<Book>> searchBooks(String query) async {
    var url = Uri.parse(
      '$_baseUrl?q=$query&key=${dotenv.env['API_BOOKS']}',
    );
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // we have data (json)
      var data = json.decode(response.body);
      if (data['items'] != null && data['items'] is List) {
        List<Book> books = (data['items'] as List<dynamic>)
            .map((item) => Book.fromJson(item as Map<String, dynamic>))
            .toList();
        return books;
      }
    } else {
      throw Exception('Failed to load books');
    }
    return [];
  }
}
