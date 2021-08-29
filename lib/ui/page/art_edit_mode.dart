// import 'package:date_time_picker/date_time_picker.dart';

// import '../../ui/common_widget/common_widget.dart';
// import '../../util/screen_size_util.dart';
// import 'package:flutter/material.dart';

// class ArtEditMode extends StatefulWidget {
//   const ArtEditMode({Key? key}) : super(key: key);

//   @override
//   _ArtEditModeState createState() => _ArtEditModeState();
// }

// class _ArtEditModeState extends State<ArtEditMode> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: unSelectedColor!),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _getNewCatUIWithTextField(context, 'Art Name', 'Enter Your Art Name'),
//           _getNewCatUIWithTextField(
//               context, 'Painter ID', 'Enter Your Painter ID'),
//           _getNewCatUIWithTextField(
//               context, 'Art Price', 'Enter Your Art Price'),
//           _getNewCatUIWithDatePicker(context, 'Manufacturing Date'),
//           _getCategoryType(context, 'Category Type'),
//           SizedBox(height: 60),
//           _getNewCatActionBtns(),
//         ],
//       ),
//     );
//   }

//   _getNewCatUIWithTextField(
//       BuildContext context, String text, String hintText) {
//     double totalWidth =
//         ScreenSizeUtil.screenWidth(context) - (viewModePadding * 2);
//     return Container(
//       width: totalWidth,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _getLabel(text, (totalWidth / 3) + 5),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8.0),
//               child: TextField(
//                 style: TextStyle(color: categoryColor),
//                 decoration: InputDecoration(
//                   hintText: hintText,
//                   hintStyle: TextStyle(color: unSelectedColor),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: unSelectedColor!),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _getLabel(text, double width) {
//     return Container(
//       width: width,
//       child: Text(
//         text,
//         textDirection: TextDirection.ltr,
//         style: categoryHeaderLstStyle(
//             purple300, FontWeight.normal, categoryHeaderDefaultFontSize),
//       ),
//     );
//   }

//   _getNewCatUIWithDatePicker(BuildContext context, String text) {
//     double totalWidth =
//         ScreenSizeUtil.screenWidth(context) - (viewModePadding * 2);
//     return Container(
//       // width: totalWidth,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _getLabel(text, (totalWidth / 3) + 5),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 12.0),
//               child: DateTimePicker(
//                 decoration: InputDecoration(
//                   icon: Icon(
//                     Icons.date_range,
//                     color: purple300,
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: unSelectedColor!),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                 ),
//                 initialValue: DateTime.now().toString(),
//                 firstDate: DateTime(1800),
//                 lastDate: DateTime(2100),
//                 onChanged: (val) => print(val),
//                 validator: (val) {
//                   print(val);
//                   return null;
//                 },
//                 onSaved: (val) => print(val),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _getCategoryType(BuildContext context, String text) {
//     double totalWidth =
//         ScreenSizeUtil.screenWidth(context) - (viewModePadding * 2);
//     return Container(
//       width: totalWidth,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _getLabel(text, (totalWidth / 3) + 5),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8.0),
//               child: DropdownButton(
//                 value: 'One',
//                 icon: const Icon(Icons.arrow_drop_down),
//                 iconSize: 24,
//                 elevation: 16,
//                 style: TextStyle(color: categoryColor),
//                 underline: Container(
//                   height: 1.2,
//                   color: unSelectedColor,
//                 ),
//                 onChanged: (String? value) {},
//                 items: <String>['One', 'Two', 'Tree', 'Four']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _getNewCatActionBtns() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         _getCatActionBtn(
//           'CANCEL',
//           () {},
//         ),
//         _getCatActionBtn(
//           'SAVE',
//           () {},
//         ),
//       ],
//     );
//   }

//   _getCatActionBtn(String text, VoidCallback callback) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         onPrimary: unSelectedColor,
//         primary: Colors.purple[700],
//         fixedSize: Size(100, 45),
//       ),
//       onPressed: () {},
//       child: Text(text),
//     );
//   }
// }
