import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextOverflow overflow;
  final FontWeight? weight;
  final double? size;
  final int? maxLine;
  final bool? softWrap;

  // final double? subScriptSize;
  // final double? superScriptSize;
  // final String superScript;
  // final String subScript;

  CText(
    this.text, {
    this.size,
    this.color,
    this.softWrap = true,
    this.maxLine,
    this.overflow = TextOverflow.ellipsis,
    this.weight,

    // this.subScript = "",
    // this.superScript = "",
    // this.subScriptSize,
    // this.superScriptSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      softWrap: softWrap,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        overflow: overflow,
      ),
    );
  }
}
