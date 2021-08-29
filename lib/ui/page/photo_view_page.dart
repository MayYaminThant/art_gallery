import '../../controller/photo_detail_controller.dart';
import '../../controller/category_list_controller.dart';
import '../../ui/menu/common_container_ceter_to_right.dart';
import '../../ui/page/photo_view_widget.dart';
import '../../ui/common_widget/common_widget.dart';
import '../../util/common_util.dart';
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
        extendBodyBehindAppBar: true,
        key: PhotoDetailView.scaffoldKey,
        body: body(context),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Consumer<CategoryListController>(
        builder: (context, catController, _) => IconButton(
          onPressed: () {
            catController.photo = newPhoto;
            Navigator.pop(context, "Backbutton data");
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white, //Colors.white,
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
                      imageUrl: catController.photo.photoUrl,
                      cacheKey: catController.photo.photoId,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.red, BlendMode.colorBurn)),
                        ),
                      ),
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
