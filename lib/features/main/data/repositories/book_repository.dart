import 'package:dio/dio.dart';
import 'package:library_flutter/features/main/data/models/book.dart';
import 'package:library_flutter/features/main/data/models/category.dart';

class BookRepository {
  BookRepository({required this.dio});

  final Dio dio;

  Future<List<Book>> getBooks(int page) async {
    final response = await dio
        .get('/books/?page=$page');
    final books = List<Book>.from(
        response.data['results'].map((value) => Book.fromMap(value)).toList());
    return books;
  }

  Future<List<Book>> searchBooks(String searchField) async {
    final response = await dio
        .get('/books/search/?search_field=$searchField');
    final books = List<Book>.from(
        response.data.map((value) => Book.fromMap(value)).toList());
    return books;
  }

  Future<List<Book>> getBooksByCategory(Category category) async {
    final response = await dio
        .get('/books/by-category/?category=${category.id}');
    final books = List<Book>.from(
        response.data.map((value) => Book.fromMap(value)).toList());
    return books;
  }
}