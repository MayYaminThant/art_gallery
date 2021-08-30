import '../../controller/category_list_controller.dart';
import '../../ui/page/photo_view_page.dart';
import '../../ui/common_widget/common_widget.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ViewModeWidget2 extends StatefulWidget {
  ViewModeWidget2({Key? key}) : super(key: key);

  @override
  _ViewModeWidgetState createState() => _ViewModeWidgetState();
}

class _ViewModeWidgetState extends State<ViewModeWidget2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0,
      ),
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
              'Latest',
              style: appTitleStyle(),
            ),
            _popularArtList,
            sizeBoxBetweenColumnCells,
          ],
        ),
      );

  get _categoryList =>
      Consumer<CategoryListController>(builder: (context, catController, _) {
        return catController.searchTerm.isEmpty
            ? SizedBox(
                height: 35,
                child: ListView.separated(
                  padding: EdgeInsets.only(
                      right: viewModePadding, top: 5, bottom: 5),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: catController.categoryLst.length,
                  itemBuilder: (BuildContext context, int index) => Center(
                    child: GestureDetector(
                      onTap: () {
                        catController.index = index;
                      },
                      child: Text(
                        '${catController.categoryLst[index].categoryName}',
                        style: categoryHeaderLstStyle(
                          catController.index == index
                              ? categoryColor!
                              : unSelectedColor!,
                          catController.index == index
                              ? FontWeight.w700
                              : FontWeight.w100,
                          catController.index == index
                              ? categoryHeaderSelectedFontSize
                              : categoryHeaderDefaultFontSize,
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      sizeBoxForCatListSeparate,
                ),
              )
            : SizedBox();
      });

  get _galleryList => Consumer<CategoryListController>(
        builder: (context, catController, _) {
          return catController.searchTerm.isEmpty
              ? SizedBox(
                  height: 300,
                  child: ListView.separated(
                    padding: EdgeInsets.only(
                        right: viewModePadding, top: 5, bottom: 5),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: catController.photoLstByCatID.length,
                    itemBuilder: (BuildContext context, int index) => Center(
                      child: InkWell(
                        onTap:
                            gestureTapCallback(context, catController, index),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                              catController.photoLstByCatID[index].photoUrl !=
                                      '0'
                                  ? CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      height: 280,
                                      width: 160,
                                      imageUrl: catController
                                          .photoLstByCatID[index].photoUrl,
                                      cacheKey: catController
                                          .photoLstByCatID[index].photoId,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    )
                                  : SizedBox(),
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        sizeBoxForCatListSeparate,
                  ),
                )
              : SizedBox();
        },
      );
}

get _popularArtList => Consumer<CategoryListController>(
      builder: (context, catController, _) => SingleChildScrollView(
        child: ListView.separated(
          padding: EdgeInsets.only(right: padding25, top: 5, bottom: 5),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: catController.filterPhotoLst.length,
          itemBuilder: (BuildContext context, int index) => Center(
            child: InkWell(
              onTap: gestureTapCallback(context, catController, index),
              child: Container(
                decoration: artBoxDecoration(),
                height: 115,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: catController.filterPhotoLst[index].photoUrl != '0'
                          ? cachedNetworkImage(catController, index)
                          : SizedBox(),
                    ),
                    SizedBox(width: 10),
                    artMiddleBody(catController, index),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 6.0, bottom: 6.0, right: 8.0),
                      child: artText(
                          '\$' +
                              catController.filterPhotoLst[index].price!
                                  .toStringAsFixed(0),
                          popularTitleColor,
                          1,
                          FontWeight.w600,
                          categoryPriceDefaultFontSize),
                    ),
                  ],
                ),
              ),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              sizeBoxBetweenColumnCells,
        ),
      ),
    );

Expanded artMiddleBody(CategoryListController catController, int index) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          artText(
              catController.filterPhotoLst[index].photoName,
              popularTitleColor,
              2,
              FontWeight.w800,
              categoryHeaderDefaultFontSize),
          artText(catController.filterPhotoLst[index].categoryName, black26, 2,
              FontWeight.bold, fontSize14),
          artText(catController.filterPhotoLst[index].photoDescription, black26,
              2, FontWeight.bold, 11),
          SizedBox(height: 10),
          ratingBar(catController.filterPhotoLst[index].rating, black12),
        ],
      ),
    ),
  );
}

BoxDecoration artBoxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    gradient: LinearGradient(colors: [
      Colors.white10,
      Colors.grey.shade200,
    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
  );
}

CachedNetworkImage cachedNetworkImage(
    CategoryListController catController, int index) {
  return CachedNetworkImage(
    fit: BoxFit.cover,
    height: 115,
    width: 130,
    imageUrl: catController.filterPhotoLst[index].photoUrl,
    cacheKey: catController.filterPhotoLst[index].photoId,
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

Text artText(String text, Color? fontColor, int? maxLine,
    FontWeight? fontWeight, double? fontSize) {
  return Text(
    text,
    maxLines: maxLine!,
    overflow: TextOverflow.ellipsis,
    style: categoryHeaderLstStyle(
      fontColor,
      fontWeight,
      fontSize,
    ),
  );
}

GestureTapCallback gestureTapCallback(
    BuildContext context, CategoryListController catController, int index) {
  return () async {
    catController.photo = catController.filterPhotoLst[index];

    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PhotoDetailView();
    }));
  };
}
