import 'package:art_gallery/model/photo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String get appTitle => 'Art Shop';
String get dateFormat => 'yyyy-MM-dd';

double get fontSize17 => 17;
double get categoryHeaderDefaultFontSize => 16;
double get categoryHeaderSelectedFontSize => 20;
double get categoryPriceDefaultFontSize => 21;
double get fontSize14 => 14;
double get popularArtCardLstHeaderSize => 20;
double get viewModePadding => 20;
double get padding25 => 25;

SizedBox get sizeBoxBetweenColumnCells {
  return SizedBox(height: 10);
}

Photo get newPhoto => Photo(
    categoryId: '0',
    photoId: '0',
    photoName: '',
    photoUrl: '0',
    categoryName: '',
    userName: '');

TextStyle categoryHeaderLstStyle(
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle appTitleStyle() {
  return getTitleStyle(Colors.black);
}

TextStyle photoViewTitleStyle() {
  return getTitleStyle(Colors.white);
}

getTitleStyle(Color color) {
  return GoogleFonts.dmSerifDisplay(
    fontWeight: FontWeight.w700,
    color: color,
    fontSize: 30,
  );
}

Color? get popularTitleColor {
  return Colors.black87;
}

Color? get unSelectedColor {
  return Colors.black26;
}

Color? get categoryColor {
  return Colors.black;
}

Color? get black12 {
  return Colors.black12;
}

Color? get black26 {
  return Colors.black26;
}

Color? get black38 {
  return Colors.black38;
}

Color? get black45 {
  return Colors.black45;
}

Color? get grey800 {
  return Colors.grey.shade800;
}
