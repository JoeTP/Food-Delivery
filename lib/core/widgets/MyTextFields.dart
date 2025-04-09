import 'package:flutter/material.dart';

class MyTextFields extends StatelessWidget {
  final String title;
  final String hint;
  final bool isPassword;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixPressed;

  MyTextFields({
    required this.hint,
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
          Text(title, style: TextStyle(fontWeight: FontWeight.w500),),
          SizedBox(height: 6),
          TextFormField(
            obscureText: isPassword,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: onSuffixPressed,
                child: Icon(suffixIcon),
              ),
              hintText: hint,
              border: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
