import 'package:art_gallery/model/photo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

double get fontSize17 => 17;
double get categoryHeaderDefaultFontSize => 16;
double get categoryHeaderSelectedFontSize => 20;
double get categoryPriceDefaultFontSize => 21;
double get fontSize14 => 14;
double get popularArtCardLstHeaderSize => 20;

Color? get popularTitleColor {
  return Colors.black87;
}

TextStyle appTitleStyle() {
  return GoogleFonts.dmSerifDisplay(
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 30,
  );
}

TextStyle photoViewTitleStyle() {
  return GoogleFonts.dmSerifDisplay(
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontSize: 50,
  );
}

Color? get unSelectedColor {
  return Colors.black26;
}

Color? get categoryColor {
  return Colors.black;
}

Color? get purple300 {
  return Colors.purple[300];
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

Color get appBarColor {
  return Colors.deepPurple;
}

SizedBox get sizeBoxBetweenColumnCells {
  return SizedBox(height: 10);
}

SizedBox get sizeBoxBetweenRowCells {
  return SizedBox(width: 20);
}

double get viewModePadding => 20;

get appTitle => 'Art Shop';

double get padding25 => 25;

String get dateFormat => 'yyyy-MM-dd';

Photo get newPhoto => Photo(
    categoryId: '0',
    photoId: '0',
    photoName: '',
    photoUrl: '0',
    categoryName: '');
