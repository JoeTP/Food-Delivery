import 'package:daythree/core/assets.dart';
import 'package:daythree/routes/AppRoutes.dart';
import 'package:flutter/material.dart';

import '../theme/Colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.onboard),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Transform.flip(
                flipY: true,
                flipX: true,
                child: Image.asset(Assets.splashdecoration),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(Assets.splashdecoration),
            ),
            Center(child: Image.asset(Assets.splashlogo)),
          ],
        ),
      ),
    );
  }
}
