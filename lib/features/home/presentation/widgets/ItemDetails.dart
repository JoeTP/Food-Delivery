import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/theme/Colors.dart';
import '../../../../core/widgets/DefaultButton.dart';
import '../../../../core/widgets/MyBackButton.dart';
import '../../data/models/Topping.dart';
import '../../data/repositories/DummyData.dart';

class AddItemToCartModalSheet extends StatefulWidget {
  const AddItemToCartModalSheet({super.key});

  @override
  State<AddItemToCartModalSheet> createState() =>
      _AddItemToCartModalSheetState();
}

class _AddItemToCartModalSheetState extends State<AddItemToCartModalSheet> {
  int itemCount = 0;

  Widget _textWithIcon(IconData icon, String text) => Row(
    children: [
      Icon(icon, color: mainColor),
      SizedBox(width: 5),
      Text(text, style: TextStyle(color: greyColor)),
    ],
  );

  Widget _toppings(Topping topping) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Image.asset(
            "assets/images/${topping.image}.png",
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
                  height: 250,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/pizza.png",
                            fit: BoxFit.contain,
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
                              "Spaghetti with shrimp and basil",
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
                              _textWithIcon(
                                Icons.local_shipping_outlined,
                                "Free delivery",
                              ),
                              SizedBox(width: 24),
                              _textWithIcon(Icons.timer, "45 mins"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, size: 24, color: Colors.amber),
                              SizedBox(width: 4),
                              Text(
                                "4.5",
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
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
                            _CartButton(
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
                            _CartButton(
                              onTap:
                                  () => setState(() {
                                    itemCount++;
                                  }),
                              icon: Icons.add,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 220,
                        child: DefaultButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text("Added $itemCount items"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          buttonText: "Add $itemCount to basket \$22.34",
                        ),
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
}

class _CartButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  _CartButton({required this.onTap, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Material(
        color: greyColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
