import 'package:daythree/core/assets.dart';
import 'package:daythree/core/constants/strings.dart';
import 'package:daythree/core/local/database/DatabaseHelper.dart';
import 'package:daythree/core/local/shared_pref/SharedPrefHelper.dart';
import 'package:daythree/routes/AppRoutes.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/values.dart';
import '../../../../core/theme/Colors.dart';
import '../../../../core/widgets/CText.dart';
import '../../../../core/widgets/DefaultButton.dart';
import '../../../../core/widgets/ImageButton.dart';
import '../../../../core/widgets/MyTextFields.dart';
import '../../data/models/User.dart';
import '../widgets/AuthTopImage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var showPass = false;
  late DatabaseHelper db;

  SharedPrefHelper prefs = SharedPrefHelper();

  TextEditingController nameController = TextEditingController();
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
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: AuthTopImage(
                title: "Sign Up",
                desc: "Please sign up to get started",
                image: Assets.registerimage,
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
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyTextFields(
                          controller: nameController,
                          title: "Full Name",
                          hint: "Enter Name",
                        ),
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
                        // CText("Forgot Password", color: mainColor),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 64 - 25,
                            vertical: 20,
                          ),
                          child: Row(
                            children: [
                              DefaultButton(
                                onPressed: handleRegisterButton,
                                buttonText: "Sign Up",
                              ),
                            ],
                          ),
                        ),
                        CText("Or Sign up with", color: greyColor),
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
                            Text("Have an account?"),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
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
                                "Sign In",
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

  void handleRegisterButton() {
    if (formKey.currentState!.validate()) {
      User user = User(
        nameController.text,
        emailController.text,
        passController.text,
      );
      db.insertUser(user).then((value) {
        if (value > 0) {
          prefs.setBool(AppConst.ISLOGGED, true);
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.home,
            (route) => false,
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Insertion Error")));
        }
      });
    }
  }
}
