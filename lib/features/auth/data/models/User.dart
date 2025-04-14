import '../../../../data/model/CartItemModel.dart';

class User {
  final String email;
  final String name;
  final String password;
  // final List<CartItemModel>? cartItems;

  User(this.name, this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      // 'cartItems': cartItems,
    };
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      json['name'],
      json['email'],
      json['password'],
      // cartItems: json['cartItems'],
    );
  }
}
