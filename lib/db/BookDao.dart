import 'package:floor/floor.dart';

import 'Book.dart';

@dao
abstract class BooksDao {
  @Query('SELECT * FROM Book')
  Future<List<Book>> findAllBooks();

  @Query("UPDATE Book SET readStatus = CASE WHEN readStatus = 1 THEN 0 ELSE 1 END WHERE id = :id")
  Future<void> updateReadStatus(int id);

  @insert
  Future<void> insertBook(Book book);
}