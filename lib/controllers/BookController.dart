import 'package:book/db/Book.dart';
import 'package:book/model/BookResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../db/database.dart';
import '../repo/Repository.dart';

class BookController extends GetxController {

  RxList<Book> book= RxList([]);
  RxList<bool> updateBool= RxList([]);
  RxList<Book> searchBook= RxList([]);
  RxBool showSearch = false.obs;
  RxBool isSearch = false.obs;
  RxBool showKeyboard = false.obs;
  GlobalKey searchTextFieldKey = GlobalKey();
  FocusNode searchTextFieldFocusNode = FocusNode();
  RxBool isLoading=  false.obs;


  Future<dynamic?> orderLoadData() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final booksDao = database.booksDao;

    final response = await Repository().loadBookData();

    if (response != null){
      for(var i in response.works!){
        String coverId = i.coverI.toString();
        String imageUrl = coverId.toString()=="null" ?"https://plus.unsplash.com/premium_photo-1667251760504-096946b820af?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDV8fGJvb2t8ZW58MHx8MHx8fDA%3D":"https://covers.openlibrary.org/b/id/$coverId-M.jpg";
        await booksDao.insertBook(Book(null,i.title.toString(),imageUrl,i.authorName.toString(), i.firstPublishYear.toString(),false));
      }
    }
}
  Future<dynamic> fetchBookData() async {
    isLoading.value= true;
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final booksDao = database.booksDao;
    book.clear();
    updateBool.clear();
    var response= await booksDao.findAllBooks();
    if(response.length==0){
      orderLoadData().then((value) => {
           fetchBookData()
      });
    }else{
      book.addAll(response);
      for(var i in response){
        updateBool.add(i.readStatus);
      }
      isLoading.value= false;

      update();
      return response;
    }

  }
  Future<void> searchBookData(String bookName) async {
    isLoading.value= true;
    searchBook.clear();
    update();
    final response = await Repository().searchBookData(bookName);
    if (response != null){
      for(var i in response.docs!){
        String coverId = i.coverI.toString();
        String imageUrl = coverId.toString()=="null" ?"https://plus.unsplash.com/premium_photo-1667251760504-096946b820af?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDV8fGJvb2t8ZW58MHx8MHx8fDA%3D":"https://covers.openlibrary.org/b/id/$coverId-M.jpg";
        searchBook.add(Book(null,i.title.toString(),imageUrl,i.authorName.toString(), i.firstPublishYear.toString(),false));
      }

    }
    isLoading.value= false;
    isSearch.value= true;
    update();
  }
  Future<void> updateReadStatus(int id) async {
    isLoading.value= true;
    update();
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final booksDao = database.booksDao;

    booksDao.updateReadStatus(id);
    isLoading.value= false;
    update();
  }



}