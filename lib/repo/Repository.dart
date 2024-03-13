import 'dart:convert';

import 'package:book/model/BookResponse.dart';
import 'package:book/model/SearchResponse.dart';
import 'package:http/http.dart' as http;

class Repository{
  Future<BookResponse> loadBookData()async{
    var request = http.Request('GET', Uri.parse('https://openlibrary.org/trending/now.json'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      return BookResponse.fromJson(jsonDecode(data));
    }
    else {
    print(response.reasonPhrase);
    }
    return BookResponse.fromJson(jsonDecode(""));
  }
  Future<SearchResponse> searchBookData(String bookName)async{
    var request = http.Request('GET', Uri.parse('https://openlibrary.org/search.json?q=$bookName'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      return SearchResponse.fromJson(jsonDecode(data));
    }
    else {
      print(response.reasonPhrase);
    }
    return SearchResponse.fromJson(jsonDecode(""));
  }
}