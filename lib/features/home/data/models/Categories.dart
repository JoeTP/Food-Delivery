class Categories {

  Categories({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  Categories.fromJson(dynamic json) {
    idCategory = json['idCategory'];
    strCategory = json['strCategory'];
    strCategoryThumb = json['strCategoryThumb'];
    strCategoryDescription = json['strCategoryDescription'];
  }

  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  Categories copyWith({
    String? idCategory,
    String? strCategory,
    String? strCategoryThumb,
    String? strCategoryDescription,
  }) => Categories(
    idCategory: idCategory ?? this.idCategory,
    strCategory: strCategory ?? this.strCategory,
    strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb,
    strCategoryDescription:
        strCategoryDescription ?? this.strCategoryDescription,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idCategory'] = idCategory;
    map['strCategory'] = strCategory;
    map['strCategoryThumb'] = strCategoryThumb;
    map['strCategoryDescription'] = strCategoryDescription;
    return map;
  }
}
