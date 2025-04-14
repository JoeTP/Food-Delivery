import 'package:daythree/core/theme/Colors.dart';
import 'package:daythree/core/widgets/DefaultButton.dart';
import 'package:daythree/core/widgets/DefaultTextField.dart';
import 'package:daythree/core/widgets/MyBackButton.dart';
import 'package:daythree/data/model/CartItemModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/local/database/DatabaseHelper.dart';
import '../../../../core/widgets/CText.dart';
import '../widgets/CartItem.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late DatabaseHelper db;

  List<CartItemModel> items = [];

  void deleteItem(int index) async {
    await db.deleteItemFromCart(items[index].id!);
    items = await db.getCartItems();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    db = DatabaseHelper();
    db.getCartItems().then((value) {
      setState(() {
        items = value;
      });
    });
    print("LENGTH ${items.length}");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [_topBar(), _cartItems(), _promoField(context), _checkout()],
    );
  }
  Widget _topBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(25.0).copyWith(bottom: 12),
        child: Row(
          children: [
            MyBackButton(),
            Expanded(
              child: CText("Cart".tr(), size: 18.sp, align: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }


  Widget _totalCost(String title, String cost) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.w),
    child: Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: CText(title, size: 18.sp, color: greyColor),
          trailing: CText("\$$cost", size: 18.sp, color: greyColor),
        ),
        Divider(height: 1, color: Colors.grey.shade300),
      ],
    ),
  );

  SliverToBoxAdapter _promoField(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 25.w),
        child: DefaultTextField(
          radius: 100,
          hasPrefix: false,
          hint: "Promo Code",
          suffix: GestureDetector(
            onTap:
                () => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Added Code"))),
            child: Container(
              width: 84,
              margin: EdgeInsets.only(right: 8, top: 4, bottom: 4),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: CText("Add", color: Colors.white, size: 16)),
            ),
          ),
        ),
      ),
    );
  }

  SliverPadding _cartItems() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverList.separated(
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemBuilder:
            (context, index) =>
                CartItem(item: items[index], onDelete: () => deleteItem(index)),
        itemCount: items.length,
      ),
    );
  }
  SliverToBoxAdapter _checkout() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          _totalCost("Subtotal", "14.30"),
          _totalCost("Tax and Fees", "4.14"),
          _totalCost("Delivery", "1.00"),
          SizedBox(height: 24),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(
                        "Delivery Address",
                        size: 22.sp,
                        weight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      CText(
                        "Avinguda Meridiana, 350, 358, 08027 Barcelona",
                        size: 16.sp,
                        maxLine: 2,
                        color: greyColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 20.h,
                  ).copyWith(bottom: 94.h),
                  decoration: BoxDecoration(
                    color: blackDarkColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      CText("Total", size: 16.sp, maxLine: 2, color: greyColor),
                      SizedBox(width: 8.w),
                      CText(
                        "\$18.44",
                        size: 22.sp,
                        weight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      SizedBox(width: 18.w),
                      DefaultButton(
                        onPressed: () {
                        },
                        buttonText: "Go to checkout",
                        textSize: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
