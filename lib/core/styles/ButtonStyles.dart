import 'package:flutter/material.dart';

import '../theme/Colors.dart';

enum DefaultButtonStyle {
  DEFAULT,
  OUTLINE_WHITE,
  BLACK;

  ButtonStyle get styles {
    switch (this) {
      case DefaultButtonStyle.DEFAULT:
        return ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          foregroundColor: Colors.white,
        );
      case DefaultButtonStyle.OUTLINE_WHITE:
        return OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white, width: 2),
          backgroundColor: Colors.white30,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        );
      case DefaultButtonStyle.BLACK:
        return ElevatedButton.styleFrom(
          backgroundColor: blackColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        );
    }
  }
}
