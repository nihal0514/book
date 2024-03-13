import 'package:floor/floor.dart';

import 'Book.dart';

@dao
abstract class BooksDao {
  @Query('SELECT * FROM Book')
  Future<List<Book>> findAllBooks();

  @Query('SELECT name FROM Book')
  Stream<List<String>> findAllBookName();

  @Query('SELECT * FROM Book WHERE id = :id')
  Stream<Book?> findBookById(int id);

  @insert
  Future<void> insertBook(Book book);
}