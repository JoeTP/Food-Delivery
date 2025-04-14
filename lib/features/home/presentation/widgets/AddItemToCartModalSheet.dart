import 'package:daythree/core/local/database/DatabaseHelper.dart';
import 'package:daythree/core/widgets/AddRemButton.dart';
import 'package:daythree/core/widgets/MyNetworkImage.dart';
import 'package:daythree/data/model/CartItemModel.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/theme/Colors.dart';
import '../../../../core/widgets/DefaultButton.dart';
import '../../../../core/widgets/MyBackButton.dart';
import '../../../../core/widgets/Rating.dart';
import '../../../../core/widgets/TextWithIcon.dart';
import '../../data/models/Meal.dart';
import '../../data/models/Topping.dart';
import '../../data/repositories/DummyData.dart';

class AddItemToCartModalSheet extends StatefulWidget {
  final Meal meal;

  const AddItemToCartModalSheet({super.key, required this.meal});

  @override
  State<AddItemToCartModalSheet> createState() =>
      _AddItemToCartModalSheetState();
}

class _AddItemToCartModalSheetState extends State<AddItemToCartModalSheet> {
  int itemCount = 0;

  late DatabaseHelper db;

  @override
  void initState() {
    super.initState();
    db = DatabaseHelper();
  }

  Widget _toppings(Topping topping) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Image.asset(
            "assets/image/${topping.image}.png",
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(topping.name, style: TextStyle(color: Colors.white)),
        ),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: topping.isSelected ? mainColor : Colors.transparent,
            border: Border.all(
              color: topping.isSelected ? Colors.transparent : Colors.white30,
              width: 1,
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 260,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 70,
                        right: 70,
                        child: Align(
                          alignment: Alignment.center,
                          child: ClipOval(
                            child: MyNetworkImage(
                              widget.meal.strMealThumb ?? "",
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        right: 25,
                        top: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyBackButton(
                              icon: Icons.clear,
                              iconSize: 24,
                              rightPadding: 5,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: blackColor.withValues(alpha: 0.1),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Icon(Icons.favorite, color: mainColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.meal.strMeal ?? "",
                              style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 26,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "\$15.30",
                            style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextWithIcon(
                                icon: Icons.local_shipping_outlined,
                                text: "Free delivery",
                              ),
                              SizedBox(width: 24),
                              TextWithIcon(icon: Icons.timer, text: "45 mins"),
                            ],
                          ),
                          Rating(rate: 4.2),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(itemDesc, style: TextStyle(color: descColor)),
                      SizedBox(height: 20),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Topping for you",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 12),
                      ...DummyData.getData().map(
                        (topping) => _toppings(topping),
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Container(
                height: 100,
                color: blackDarkColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            AddRemButton(
                              onTap:
                                  () => setState(() {
                                    itemCount--;
                                  }),
                              icon: Icons.remove,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                itemCount.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            AddRemButton(
                              onTap:
                                  () => setState(() {
                                    itemCount++;
                                  }),
                              icon: Icons.add,
                            ),
                          ],
                        ),
                      ),
                      DefaultButton(
                        flex: 2,
                        onPressed: handleAddButton,
                        buttonText: "Add $itemCount to basket \$22.34",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleAddButton() {
    if (itemCount > 0) {
      CartItemModel cartItem = CartItemModel(
        id: widget.meal.idMeal,
        name: widget.meal.strMeal,
        image: widget.meal.strMealThumb,
        count: itemCount,
      );
      db.insertItemToCart(cartItem).then((value) {
        if (value > 0) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text("Added $itemCount items"),
              duration: Duration(seconds: 2),
            ),
          );
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text("Failed to add"),
              duration: Duration(seconds: 2),
            ),
          );
        }
      });
    }
  }
}
