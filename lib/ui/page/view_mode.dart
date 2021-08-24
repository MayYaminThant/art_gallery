import 'package:art_gallery/controller/category_list_controller.dart';
import 'package:provider/provider.dart';

import '../../controller/bottom_nav_bar_controller.dart';
import '../../ui/common_widget/common_widget.dart';
import 'package:flutter/material.dart';

class ViewModeWidget extends StatelessWidget {
  ViewModeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _artList;
  }

  Widget get _artList => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _categoryList,
            _galleryList,
          ],
        ),
      );

  get _categoryList => SizedBox(
        height: 35,
        child: Consumer<CategoryListController>(
          builder: (context, catController, _) => ListView.separated(
            padding: EdgeInsets.all(5),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categoryLst.length,
            itemBuilder: (BuildContext context, int index) => Center(
              child: GestureDetector(
                onTap: () {
                  catController.index = index;
                  // catController.selectedColor = Colors.black;
                },
                child: Text(
                  '${categoryLst[index]}',
                  style: categoryHeaderLstStyle(catController.index == index
                      ? categoryColor!
                      : unSelectedColor!),
                ),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 10,
            ),
          ),
        ),
      );

  get _galleryList => SizedBox(
        height: 180,
        child: ListView.separated(
          padding: EdgeInsets.all(5),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: galleryLst.length,
          itemBuilder: (BuildContext context, int index) => Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                galleryLst[index],
                fit: BoxFit.cover,
                height: 180,
                width: 120,
              ),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
        ),
      );
}
