import '../models/Topping.dart';

class DummyData {
  static List<Topping> getData() => [
    Topping(true, "olives", "Olives"),
    Topping(false, "cheese", "Cheese"),
    Topping(false, "mushrooms", "Mushrooms"),
    Topping(true, "cheese", "Cheese"),
    Topping(false, "cheese", "Cheese"),
  ];
}
