import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle categoryHeaderLstStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 17,
  );
}

TextStyle appTitleStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 17,
  );
}

Color? get unSelectedColor {
  return Colors.purple[100];
}

Color? get categoryColor {
  return Colors.purple[500];
}

Color get appBarColor {
  return Colors.deepPurple;
}
// class CategoryHeaderLstStyle {
//   final Color? color;
//   final double? fontSize;

//   const CategoryHeaderLstStyle({this.color, this.fontSize});

//   CategoryHeaderLstStyle copyWith({
//     Color? color,
//     double? fontSize,
//   }) {
//     return CategoryHeaderLstStyle(
//       color: color ?? this.color,
//       fontSize: fontSize ?? this.fontSize,
//     );
//   }
// }
