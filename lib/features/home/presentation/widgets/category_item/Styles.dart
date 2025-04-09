
import 'package:flutter/material.dart';

import '../../../../../core/theme/Colors.dart';

final containerShadow = [
  BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 20,
    color: Colors.black.withValues(alpha: 0.1),
  ),
  BoxShadow(offset: Offset(0, -4), blurRadius: 10, color: bgColor),
  BoxShadow(offset: Offset(4, -4), blurRadius: 10, color: bgColor),
  BoxShadow(offset: Offset(-4, -4), blurRadius: 20, color: bgColor),
];