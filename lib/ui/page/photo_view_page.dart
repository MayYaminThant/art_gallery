import '../../controller/photo_detail_controller.dart';
import '../../controller/category_list_controller.dart';
import '../../ui/menu/common_container_ceter_to_right.dart';
import '../../ui/page/photo_view_widget.dart';
import '../../ui/common_widget/common_widget.dart';
import '../../util/common_util.dart';
import '../../util/screen_size_util.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoDetailView extends StatefulWidget {
  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoDetailView> {
  @override
  Widget build(BuildContext context) {
    CommonUtils.doInFuture(() {
      context.read<PhotoDetailController>().isShowDetail = true;
    });
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: body(context),
        extendBodyBehindAppBar: true,
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
                  ? photoViewWidget(context, catController)
                  : SizedBox(),
        ),
        child: PhotoViewWidget(),
      ),
    );
  }

  photoViewWidget(
    BuildContext context,
    CategoryListController catController,
  ) {
    return Container(
      width: ScreenSizeUtil.screenWidth(context),
      height: ScreenSizeUtil.screenHeight(context),
      padding: EdgeInsets.all(20),
      child: PhotoView(
        backgroundDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
        imageProvider: NetworkImage(
          catController.photo.photoUrl,
        ),
        loadingBuilder: (_, __) => Center(
          child: CircularProgressIndicator(),
        ),
        errorBuilder: (_, __, ___) => Icon(Icons.error),
      ),
    );
  }
}
