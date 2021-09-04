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
              height: 300,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Consumer<CategoryListController>(
                  builder: (BuildContext bContex, catController, _) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: children(context, catController),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> children(
      BuildContext context, CategoryListController catController) {
    return [
      _showValue(context, 'Category', catController.photo.categoryName),
      _showValue(context, 'Painter', catController.photo.customerName),
      _showRating(context, 'Rating', catController.photo.rating),
      _showValue(context, 'Description', catController.photo.photoDescription),
      _showValue(
          context,
          'Created Date',
          catController.photo.createdDate == null
              ? ''
              : catController.photo.createdDate!),
      _showValue(
          context,
          'Modified Date',
          catController.photo.createdDate == null
              ? ''
              : catController.photo.modifiedDate!),
      _showValue(
        context,
        'Price',
        '\$' + catController.photo.price!.toStringAsFixed(0),
      ),
    ];
  }

  _showValue(context, String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: _labelWidth(context),
          child: Text(
            key,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: fontSize17,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize14,
            ),
          ),
        ),
      ],
    );
  }

  _showRating(context, String key, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: _labelWidth(context),
          child: Text(
            key,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: fontSize17,
            ),
          ),
        ),
        ratingBar(value, Colors.white30),
      ],
    );
  }

  double _labelWidth(BuildContext ctx) =>
      (ScreenSizeUtil.screenWidth(ctx) / 3) - 40;
}
