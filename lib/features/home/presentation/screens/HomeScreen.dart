import 'package:daythree/core/theme/Colors.dart';
import 'package:daythree/core/widgets/CText.dart';
import 'package:daythree/core/widgets/MyBackButton.dart';
import 'package:daythree/features/home/presentation/widgets/Header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets.dart';
import '../../../../core/widgets/DefaultTextField.dart';
import '../../data/data_sources/remote/RemoteDataSource.dart';
import '../../data/models/Categories.dart';
import '../../data/models/Meal.dart';
import '../widgets/AddItemToCartModalSheet.dart';
import '../widgets/HorizontalList.dart';
import '../widgets/RestaurantCard.dart';
import '../widgets/SpecialOfferCard.dart';
import '../widgets/category_item/CategoryCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final RemoteDataSource dataSource;
  late Future<List<Categories>> futureCategories;
  late List<Meal> meals;
  Meal? selectedMeal;
  int selectedIndex = 0;
  List<Categories>? loadedCategories;

  @override
  void initState() {
    super.initState();
    dataSource = RemoteDataSource();
    futureCategories = dataSource.fetchCategories().then((categories) async {
      loadedCategories = categories;
      if (categories.isNotEmpty) {
        meals = await dataSource.fetchMealsByCategory(
          categories.first.strCategory!,
        );
        setState(() {
          selectedMeal = meals.isNotEmpty ? meals.first : null;
        });
      }
      return categories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCategories,
      builder:
          (context, snapshot) =>
              snapshot.hasData
                  ? Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          topHeader(),
                          _categorySection(snapshot.data),
                          Header(title: "Special Offers"),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 130.h,
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 25),

                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      showDetails(context, meals[index]);
                                    },
                                    child: SpecialOfferCard(meal: meals[index]),
                                  ),
                              separatorBuilder:
                                  (context, index) => SizedBox(width: 8),
                              scrollDirection: Axis.horizontal,
                              itemCount: meals.length,
                            ),
                          ),
                          SizedBox(height: 20),
                          Header(title: "Restaurant"),
                          HorizontalList(height: 270, item: RestaurantCard()),
                          SizedBox(height: 94),
                        ],
                      ),
                    ),
                  )
                  : snapshot.hasError
                  ? Center(child: Text(snapshot.error.toString()))
                  : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _categorySection(List<Categories>? categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CText(
                "Good Afternoon!",
                size: 20,
                weight: FontWeight.w700,
                gradient: LinearGradient(colors: [mainColor, yellowColor]),
              ),
              SizedBox(height: 8),
              DefaultTextField(hint: "Search dishes, restaurants"),
              SizedBox(height: 20),
            ],
          ),
        ),
        Container(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 25),
            itemCount: categories?.length ?? 0,
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemBuilder: (context, index) {
              final category = categories![index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () async {
                  meals = await dataSource.fetchMealsByCategory(
                    category.strCategory!,
                  );
                  setState(() {
                    selectedIndex = index;
                    selectedMeal = meals.isNotEmpty ? meals.first : null;
                  });
                },
                child: CategoryCard(
                  categories: category,
                  isSelected: isSelected,
                ),
              );
            },
          ),
        ),
      ],
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
              image: DecorationImage(image: AssetImage(Assets.profileimage)),
            ),
          ),
        ],
      ),
    );
  }
}

showDetails(context, Meal meal) => showModalBottomSheet(
  backgroundColor: Colors.white,
  constraints: BoxConstraints(
    maxHeight: MediaQuery.of(context).size.height * 0.85,
    minHeight: 0,
  ),
  isScrollControlled: true,
  showDragHandle: true,
  enableDrag: true,
  context: context,
  builder: (context) => AddItemToCartModalSheet(meal: meal),
);
