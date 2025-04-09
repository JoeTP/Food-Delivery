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
                child: Image.asset("assets/images/splashDecoration.png"),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset("assets/images/splashDecoration.png"),
            ),
            Center(child: Image.asset("assets/images/splashLogo.png")),
          ],
        ),
      ),
    );
  }
}
