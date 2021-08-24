import '../../ui/common_widget/common_widget.dart';
import '../../util/screen_size_util.dart';
import 'package:flutter/material.dart';

class CategoryMode extends StatelessWidget {
  const CategoryMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: unSelectedColor!),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getNewCatUI(context),
          SizedBox(height: 60),
          _getNewCatActionBtns(),
        ],
      ),
    );
  }

  _getNewCatUI(BuildContext context) {
    double totalWidth =
        ScreenSizeUtil.screenWidth(context) - (viewModePadding * 2);
    return Container(
      width: totalWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (totalWidth / 3) + 5,
            child: Text(
              'Category Name',
              style: categoryHeaderLstStyle(Colors.purple[300]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                style: TextStyle(color: categoryColor),
                decoration: InputDecoration(
                  hintText: 'Enter New Category Name',
                  hintStyle: TextStyle(color: unSelectedColor),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: unSelectedColor!),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getNewCatActionBtns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getCatActionBtn(
          'CANCEL',
          () {},
        ),
        _getCatActionBtn(
          'SAVE',
          () {},
        ),
      ],
    );
  }

  _getCatActionBtn(String text, VoidCallback callback) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: unSelectedColor,
        primary: Colors.purple[700],
        fixedSize: Size(100, 45),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
