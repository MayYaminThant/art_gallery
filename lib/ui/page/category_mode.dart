import 'package:art_gallery/controller/category_list_controller.dart';
import 'package:provider/provider.dart';

import '../../ui/common_widget/common_widget.dart';
import '../../util/screen_size_util.dart';
import 'package:flutter/material.dart';

class CategoryMode extends StatelessWidget {
  CategoryMode({Key? key}) : super(key: key);
  final TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding:
          const EdgeInsets.only(left: 8.0, top: 20.0, bottom: 8.0, right: 8.0),
      decoration: BoxDecoration(
          border: Border.all(color: unSelectedColor!),
          borderRadius: BorderRadius.circular(4.0)),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getExistingCatTypes(context),
            _getNewCatUI(context),
            SizedBox(height: 60),
            _getNewCatActionBtns(),
          ],
        ),
      ),
    );
  }

  _getExistingCatTypes(BuildContext context) {
    double totalWidth =
        ScreenSizeUtil.screenWidth(context) - (viewModePadding * 2);
    return Container(
      width: totalWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getLabelUIofCategory('Category Type', totalWidth),
          Expanded(
            child: Container(
              height: 55,
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CategoryListController>(
                builder: (BuildContext buildContext, catController, _) =>
                    DropdownButton(
                        elevation: 16,
                        underline: Container(
                          height: 1.2,
                          color: unSelectedColor,
                        ),
                        value: catController.categoryLst.isNotEmpty
                            ? catController.categoryLst[0].categoryName
                            : '',
                        onChanged: (String? value) {},
                        items: [
                          DropdownMenuItem<String>(
                              value: 'Add New Category',
                              child: Text('Add New Category'))
                        ]..addAll(
                            catController.categoryLst
                                .map((e) => DropdownMenuItem<String>(
                                    value: e.categoryName,
                                    child: Text(e.categoryName)))
                                .toList(),
                          )),
              ),
            ),
          ),
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
          _getLabelUIofCategory('Category Name', totalWidth),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Input Your Category Name';
                  }
                  return null;
                },
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
          () {
            if (_formKey.currentState!.validate()) {
              print('Process Data');
            }
          },
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
      onPressed: callback,
      child: Text(text),
    );
  }

  _getLabelUIofCategory(text, totalWidth) {
    return Container(
      width: (totalWidth / 3) + 5,
      child: Text(
        text,
        style: categoryHeaderLstStyle(
            purple300, FontWeight.normal, fontSize17),
      ),
    );
  }
}
