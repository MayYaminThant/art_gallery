import '../../model/photo.dart';
import '../../util/screen_size_util.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

SizedBox get sizeBoxForCatListSeparate {
  return SizedBox(width: 15);
}

Photo get newPhoto => Photo(
    categoryId: '0',
    photoId: '0',
    photoName: '',
    photoUrl: '0',
    categoryName: '',
    customerName: '',
    photoDescription: '',
    rating: 0);

RatingBar ratingBar(rating, unRatedClr) {
  return RatingBar.builder(
    initialRating: rating,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemSize: 15,
    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    unratedColor: unRatedClr,
    onRatingUpdate: (rating) {},
  );
}

TextStyle categoryHeaderLstStyle(
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
) {
  return TextStyle(
    color: color!,
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

TextStyle loginTitleStyle() {
  return getTitleStyle(Colors.black);
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

Color? get black54 {
  return Colors.black54;
}

Color? get grey800 {
  return Colors.grey.shade800;
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
            primary: Colors.black.withOpacity(0.85),
            textStyle: TextStyle(
              fontSize: 16.5,
            ),
          ),
        ),
      );
}

loginParentBody(
  GlobalKey<FormState> _formKey,
  String? errorString,
  List<Widget> children,
) {
  return Padding(
    padding: EdgeInsets.all(12),
    child: Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: children,
          ),
        )
      ],
    ),
  );
}

commonLoginTextFeild(
  TextEditingController _textController,
  InputDecoration decoration,
  String? Function(String?) validator,
) {
  return Container(
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: black12!,
          offset: const Offset(
            3.0,
            3.0,
          ),
          blurRadius: 5.0,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: Colors.white,
          offset: const Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ),
      ],
    ),
    child: Center(
      child: TextFormField(
        cursorColor: black45,
        controller: _textController,
        decoration: decoration,
        validator: validator,
      ),
    ),
  );
}

InputDecoration loginTextFeildDecoration() {
  return InputDecoration(
    hintText: 'Email Address',
    hintStyle: TextStyle(
      color: Colors.black.withOpacity(0.3),
      fontWeight: FontWeight.bold,
    ),
    fillColor: Colors.white,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
  );
}

void showErrorDialog(BuildContext context, String title, Exception e) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                '${(e as dynamic).message}',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        actions: [
          StyledButton(
              child: Text('OK', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      );
    },
  );
}

getLoginHeaderUI(BuildContext context, List<Widget> children) {
  double height = ScreenSizeUtil.screenHeight(context);
  return Padding(
    padding: const EdgeInsets.all(17.0),
    child: Container(
      width: double.infinity,
      height: height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
      ),
    ),
  );
}
