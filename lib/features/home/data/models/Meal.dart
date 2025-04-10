class Meal {
  final String? idMeal;
  final String? strMeal;
  final String? strMealAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<String>? ingredients;
  final List<String>? measures;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strMealAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.ingredients,
    this.measures,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.toString().isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? '');
      }
    }

    return Meal(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealAlternate: json['strMealAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
    );
  }
}
