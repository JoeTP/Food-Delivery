import 'package:daythree/core/assets.dart';
import 'package:daythree/core/local/database/DatabaseHelper.dart';
import 'package:daythree/routes/AppRoutes.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/constants/values.dart';
import '../../../../core/local/shared_pref/SharedPrefHelper.dart';
import '../../../../core/theme/Colors.dart';
import '../../../../core/widgets/CText.dart';
import '../../../../core/widgets/DefaultButton.dart';
import '../../../../core/widgets/ImageButton.dart';
import '../../../../core/widgets/MyTextFields.dart';
import '../widgets/AuthTopImage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var showPass = false;
  SharedPrefHelper prefs = SharedPrefHelper();

  late DatabaseHelper db;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    db = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: AuthTopImage(
                title: "Login",
                desc: "Please sign in to your existing account",
                image: Assets.loginimage,
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Container(
                  padding: mainPadding,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyTextFields(
                          controller: emailController,
                          title: "Email",
                          hint: "Enter Email",
                        ),
                        MyTextFields(
                          controller: passController,
                          title: "Password",
                          hint: "Password",
                          isPassword: !showPass,
                          suffixIcon:
                              showPass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                          onSuffixPressed:
                              () => setState(() {
                                showPass = !showPass;
                              }),
                        ),
                        CText("Forgot Password", color: mainColor),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 64 - 25,
                            vertical: 20,
                          ),
                          child: Row(
                            children: [
                              DefaultButton(
                                onPressed: handleLoginButton,
                                buttonText: "Login",
                              ),
                            ],
                          ),
                        ),
                        CText("Or Login with", color: greyColor),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            ImageButton(
                              onPress: () {},
                              buttonText: "FACEBOOK",
                              image: "facebook",
                            ),
                            SizedBox(width: 30),
                            ImageButton(
                              onPress: () {},
                              buttonText: "GOOGLE",
                              image: "google",
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed:
                                  () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.register,
                                  ),
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.resolveWith<
                                  Color?
                                >((Set<WidgetState> states) {
                                  if (states.contains(WidgetState.pressed)) {
                                    return mainColor.withValues(alpha: 0.1);
                                  }
                                  return null;
                                }),
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: mainColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleLoginButton() {
    if (formKey.currentState!.validate()) {
      db.getUser(emailController.text, passController.text).then((value) {
        if (value != null) {
          prefs.setBool(AppConst.ISLOGGED, true);
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.home,
            (route) => false,
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Invalid Credentials")));
        }
      });
    }
  }
}
