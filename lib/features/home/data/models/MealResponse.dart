
import 'Meal.dart';

class MealResponse {
  List<Meal>? meals;

  MealResponse({this.meals});

  MealResponse.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = List<Meal>.from(
        json['meals'].map((meal) => Meal.fromJson(meal)),
      );
    }
  }
}
