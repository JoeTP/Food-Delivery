import 'Categories.dart';

class Category {

  Category({this.categories});

  Category.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }

  List<Categories>? categories;

  Category copyWith({List<Categories>? categories}) =>
      Category(categories: categories ?? this.categories);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
