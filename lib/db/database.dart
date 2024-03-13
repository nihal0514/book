import 'dart:async';
import 'package:book/db/BookDao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'Book.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase {
  BooksDao get booksDao;
}