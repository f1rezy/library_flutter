import 'package:dio/dio.dart';
import 'package:library_flutter/features/main/data/models/category.dart';

class CategoryRepository {
  CategoryRepository({required this.dio});

  final Dio dio;

  Future<List<Category>> getCategories() async {
    final response = await dio
        .get('/categories/');
    final categories = List<Category>.from(
        response.data.map((value) => Category.fromMap(value)).toList());
    return categories;
  }
}