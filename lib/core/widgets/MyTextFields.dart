import 'package:daythree/core/theme/Colors.dart';
import 'package:flutter/material.dart';

class MyTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool isPassword;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixPressed;

  MyTextFields({
    required this.hint,
    required this.controller,
    required this.title,
    this.isPassword = false,
    this.suffixIcon,
    this.onSuffixPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 6),
          TextFormField(
            controller: controller,
            validator: (s){
              if(s!.isEmpty){
                return "Field can't be empty";
              }
              return null;
            },
            obscureText: isPassword,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: onSuffixPressed,
                child: Icon(suffixIcon),
              ),
              hintText: hint,
              hintStyle: TextStyle(color: greyColor.withValues(alpha: 0.6)),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: mainColor),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),

              filled: true,
              fillColor: lightGrey,

              suffixIconColor: greyColor.withValues(alpha: 0.5),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),

              border: OutlineInputBorder(
                borderSide: BorderSide(color: mainColor),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
