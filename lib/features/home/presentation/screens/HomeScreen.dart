import 'package:daythree/core/theme/Colors.dart';
import 'package:daythree/core/widgets/CText.dart';
import 'package:daythree/core/widgets/MyBackButton.dart';
import 'package:daythree/features/home/presentation/widgets/Header.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/DefaultTextField.dart';
import '../widgets/category_item/CategoryCard.dart';
import '../widgets/HorizontalList.dart';
import '../widgets/AddItemToCartModalSheet.dart';
import '../widgets/RestaurantCard.dart';
import '../widgets/SpecialOfferCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topHeader(),
            categorySection(),
            GestureDetector(
              onTap: () => later(context),
              child: Header(title: "Special Offers"),
            ),
            SizedBox(height: 10),
            HorizontalList(item: SpecialOfferCard(), height: 130),
            SizedBox(height: 20),
            Header(title: "Restaurant"),
            HorizontalList(height: 270, item: RestaurantCard()),
            SizedBox(height: 94),
          ],
        ),
      ),
    );
  }

  Padding categorySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CText(
            "Good Afternoon!",
            size: 20,
            weight: FontWeight.w700,
            gradient: LinearGradient(colors: [mainColor, yellowColor]),
          ),
          SizedBox(height: 8),
          DefaultTextField(),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) => CategoryCard(image: "sand"
                  "witch",title: "Burger",))),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget topHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyBackButton(icon: Icons.menu, rightPadding: 5),
          Column(children: [CText("Deliver To"), CText("357 Merdina")]),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/profileImage.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

later(context) => showModalBottomSheet(
  backgroundColor: Colors.white,
  constraints: BoxConstraints(
    maxHeight: MediaQuery.of(context).size.height * 0.85,
    minHeight: 0,
  ),
  isScrollControlled: true,
  showDragHandle: true,
  enableDrag: true,
  context: context,
  builder: (context) => AddItemToCartModalSheet(),
);
