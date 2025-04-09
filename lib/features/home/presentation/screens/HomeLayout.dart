import 'package:daythree/core/theme/Colors.dart';
import 'package:daythree/features/cart/presentation/screens/CartScreen.dart';
import 'package:daythree/features/home/presentation/screens/HomeScreen.dart';
import 'package:daythree/features/notification/presentation/screens/NotificationScreen.dart';
import 'package:daythree/features/profile/presentation/screens/ProfileScreen.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/BottomNav.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
    NotificationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            _screens[_selectedIndex],
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: BottomNav(
                selectedIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
