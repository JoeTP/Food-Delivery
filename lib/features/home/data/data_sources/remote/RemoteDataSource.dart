import 'package:daythree/core/network/DioCleint.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/endpoints.dart';
import '../../models/Categories.dart';
import '../../models/Category.dart';
import '../../models/Meal.dart';
import '../../models/MealResponse.dart';

class RemoteDataSource {
  final Dio dio = DioClient.instance;

  Future<List<Categories>> fetchCategories() async {
    try {
      final response = await dio.get(CATEGORIES_EP);
      if (response.statusCode == 200) {
        final category = Category.fromJson(response.data);
        return category.categories ?? [];
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('error: $e');
    }
  }

  Future<List<Meal>> fetchMealsByCategory(String categoryName) async {
    try {
      final response = await dio.get(
        '${BASE_URL}filter.php',
        queryParameters: {'c': categoryName},
      );

      if (response.statusCode == 200) {
        final meals = MealResponse.fromJson(response.data);
        return meals.meals ?? [];
      } else {
        throw Exception('Failed to load meals');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Meal> fetchMealById(int id) async {
    try {
      final response = await dio.get(
        "${BASE_URL}lookup.php",
        queryParameters: {"i": id},
      );

      if (response.statusCode == 200) {
        final meals = MealResponse.fromJson(response.data);
        return meals.meals?.first ?? Meal();
      } else {
        throw Exception('Failed to load meals');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
