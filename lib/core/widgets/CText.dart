import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  final TextOverflow overflow;
  final FontWeight? weight;
  final double? size;
  final int? maxLine;
  final bool? softWrap;

  CText(
      this.text, {
        this.size,
        this.color,
        this.gradient,
        this.softWrap = true,
        this.maxLine,
        this.overflow = TextOverflow.ellipsis,
        this.weight,
        super.key,
      }) : assert(color == null || gradient == null,
  'Cannot provide both color and gradient');

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      maxLines: maxLine,
      softWrap: softWrap,
      style: TextStyle(
        color: gradient == null ? color : Colors.white,
        fontSize: size,
        fontWeight: weight,
        overflow: overflow,
      ),
    );

    if (gradient != null) {
      return ShaderMask(
        shaderCallback: (bounds) => gradient!.createShader(bounds),
        child: textWidget,
      );
    }

    return textWidget;
  }
}