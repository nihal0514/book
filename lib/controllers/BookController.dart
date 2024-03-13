import 'package:book/db/Book.dart';
import 'package:book/model/BookResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../db/database.dart';
import '../repo/Repository.dart';

class BookController extends GetxController {

  RxList<Book> book= RxList([]);
  RxList<Book> searchBook= RxList([]);
  RxBool showSearch = false.obs;
  RxBool isSearch = false.obs;
  RxBool showKeyboard = false.obs;
  GlobalKey searchTextFieldKey = GlobalKey();
  FocusNode searchTextFieldFocusNode = FocusNode();


  Future<dynamic?> orderLoadData() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final booksDao = database.booksDao;

    final response = await Repository().loadBookData();

    if (response != null){
      for(var i in response.works!){
        String coverId = i.coverI.toString();
        String imageUrl = "https://covers.openlibrary.org/b/id/$coverId-M.jpg";
        await booksDao.insertBook(Book(null,i.title.toString(),imageUrl,i.authorName.toString(), i.firstPublishYear.toString(),false));
      }
    }
}
  Future<List<Book>> fetchBookData() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final booksDao = database.booksDao;

    var response= await booksDao.findAllBooks();
    book.addAll(response);
    return response;
  }
  Future<void> searchBookData(String bookName) async {
    final response = await Repository().searchBookData(bookName);

    if (response != null){
      for(var i in response.docs!){
        String coverId = i.coverI.toString();
        String imageUrl = "https://covers.openlibrary.org/b/id/$coverId-M.jpg";
        book.add(Book(null,i.title.toString(),imageUrl,i.authorName.toString(), i.firstPublishYear.toString(),false));
      }

    }
  }

}