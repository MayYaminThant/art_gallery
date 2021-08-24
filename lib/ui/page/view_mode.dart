import '../../util/screen_size_util.dart';

import '../../controller/category_list_controller.dart';
import 'package:provider/provider.dart';

import '../../controller/bottom_nav_bar_controller.dart';
import '../../ui/common_widget/common_widget.dart';
import 'package:flutter/material.dart';

class ViewModeWidget extends StatelessWidget {
  ViewModeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: viewModePadding),
      child: _artList(context),
    );
  }

  Widget _artList(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _categoryList,
            _galleryList,
            sizeBoxBetweenColumnCells,
            Text(
              'Popular Art',
              style: categoryHeaderLstStyle(categoryColor!),
            ),
            _popularArtList,
            sizeBoxBetweenColumnCells,
            Text(
              'Popular Artist',
              style: categoryHeaderLstStyle(categoryColor!),
            ),
            _popularPainterList(context),
          ],
        ),
      );

  get _categoryList => SizedBox(
        height: 35,
        child: Consumer<CategoryListController>(
          builder: (context, catController, _) => ListView.separated(
            padding: EdgeInsets.only(right: viewModePadding, top: 5, bottom: 5),
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
              width: 15,
            ),
          ),
        ),
      );

  get _galleryList => SizedBox(
        height: 180,
        child: ListView.separated(
          padding: EdgeInsets.only(right: viewModePadding, top: 5, bottom: 5),
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
            width: 22,
          ),
        ),
      );
}

get _popularArtList => SizedBox(
      height: 100,
      child: ListView.separated(
        padding: EdgeInsets.only(right: viewModePadding, top: 5, bottom: 5),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: galleryLst.length,
        itemBuilder: (BuildContext context, int index) => Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              galleryLst[index],
              fit: BoxFit.cover,
              height: 100,
              width: 110,
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 22,
        ),
      ),
    );

Widget _popularPainterList(BuildContext context) => SizedBox(
      width: (ScreenSizeUtil.screenWidth(context) - (viewModePadding * 2)),
      child: SingleChildScrollView(
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 5, bottom: 5),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: galleryLst.length,
          itemBuilder: (BuildContext context, int index) => Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                // fit: StackFit.loose,
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.yellow[700]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/image/codelab.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                        sizeBoxBetweenRowCells,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Martha Barnett',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Painter',
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 22,
          ),
        ),
      ),
    );
