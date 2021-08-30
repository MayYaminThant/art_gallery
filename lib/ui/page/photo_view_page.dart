import '../../controller/photo_detail_controller.dart';
import '../../controller/category_list_controller.dart';
import '../../ui/menu/common_container_ceter_to_right.dart';
import '../../ui/page/photo_view_widget.dart';
import '../../ui/common_widget/common_widget.dart';
import '../../util/common_util.dart';
import '../../util/screen_size_util.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotoDetailView extends StatefulWidget {
  const PhotoDetailView();
  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoDetailView> {
  @override
  Widget build(BuildContext context) {
    CommonUtils.doInFuture(() {
      context.read<CategoryListController>().getCategoryData();
      context.read<CategoryListController>().getPhotoData();
    });
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        key: PhotoDetailView.scaffoldKey,
        body: body(context),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black.withOpacity(0.5),
      leading: Consumer<CategoryListController>(
        builder: (context, catController, _) => IconButton(
          onPressed: () {
            catController.photo = newPhoto;
            Navigator.pop(context, "Backbutton data");
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      title: Consumer<CategoryListController>(
        builder: (BuildContext bContex, catController, _) => Container(
          alignment: Alignment.centerRight,
          child: Text(
            catController.photo.photoName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: photoViewTitleStyle(),
          ),
        ),
      ),
    );
  }

  body(context) {
    return Consumer<PhotoDetailController>(
      builder: (context, detailController, _) => AnimateRightToLeft(
        visible: detailController.isShowDetail,
        body: Consumer<CategoryListController>(
          builder: (BuildContext bContex, catController, _) =>
              catController.photo.photoUrl != '0'
                  ? CachedNetworkImage(
                      fit: BoxFit.contain,
                      width: ScreenSizeUtil.screenWidth(context),
                      imageUrl: catController.photo.photoUrl,
                      cacheKey: catController.photo.photoId,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : SizedBox(),
        ),
        child: PhotoViewWidget(),
      ),
    );
  }
}
