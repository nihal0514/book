import 'package:floor/floor.dart';

@entity
class Book {
  @PrimaryKey(autoGenerate: true)
  final int?  id;

  final String title;
  final String cover;
  final String author;
  final String publishedYear;
  final bool readStatus;

  Book(this.id, this.title, this.cover, this.author, this.publishedYear,
      this.readStatus);
}