import 'package:daythree/routes/AppRoutes.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/styles/ButtonStyles.dart';
import '../../../../core/theme/Colors.dart';
import '../../../../core/widgets/DefaultButton.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Container(
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset("assets/images/onboardImage.png"),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Transform.flip(
                  flipX: true,
                  flipY: true,
                  child: Image.asset(
                    width: 380,
                    fit: BoxFit.cover,
                    "assets/images/splashDecoration.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25).copyWith(bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      onboardText,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultButton(
                          onPressed:
                              () =>
                                  Navigator.pushNamed(context, AppRoutes.register),
                          buttonText: "Sign Up",
                          style: DefaultButtonStyle.OUTLINE_WHITE,
                        ),
                        SizedBox(width: 18),
                        DefaultButton(
                          onPressed:
                              () => Navigator.pushNamed(
                                context,
                                AppRoutes.login,
                              ),
                          buttonText: "Log in",
                          style: DefaultButtonStyle.BLACK,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
