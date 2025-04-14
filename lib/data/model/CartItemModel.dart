class CartItemModel {
  String? id;
  String? name;
  String? image;
  int? count;

  CartItemModel({this.id, this.name, this.image, this.count});

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image, 'count': count};
  }
}
