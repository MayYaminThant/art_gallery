import '../../controller/photo_detail_controller.dart';
import '../../controller/category_list_controller.dart';
import '../../ui/common_widget/common_widget.dart';
import '../../util/screen_size_util.dart';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoViewWidget extends StatelessWidget {
  const PhotoViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PhotoDetailController>(
      builder: (BuildContext bContext, detailController, _) => GestureDetector(
        onTap: () {
          detailController.isShowDetail = !detailController.isShowDetail;
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Card(
            elevation: 2,
            color: Colors.black.withOpacity(0.5),
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Consumer<CategoryListController>(
                  builder: (BuildContext bContex, catController, _) => Column(
                    children: [
                      _showValue(context, 'Category Name',
                          catController.photo.categoryName),
                      sizeBoxBetweenColumnCells,
                      _showValue(
                          context,
                          'Created Date',
                          catController.photo.createdDate == null
                              ? ''
                              : catController.photo.createdDate!),
                      sizeBoxBetweenColumnCells,
                      _showValue(
                          context,
                          'Modified Date',
                          catController.photo.createdDate == null
                              ? ''
                              : catController.photo.modifiedDate!),
                      sizeBoxBetweenColumnCells,
                      _showValue(context, 'Price',
                          '\$' + catController.photo.price.toString()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showValue(context, String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: ScreenSizeUtil.screenWidth(context) / 3,
          child: Text(key,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize17)),
        ),
        Text(value,
            style: TextStyle(color: Colors.white, fontSize: fontSize14)),
      ],
    );
  }
}
