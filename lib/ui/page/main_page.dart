import '../../controller/category_list_controller.dart';
import '../../ui/menu/common_background_with_painter.dart';
import '../../ui/common_widget/common_widget.dart';
import '../../ui/page/view_mode_2.dart';
import '../../ui/page/category_mode.dart';
import '../../util/common_util.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../bottom_nav_bar.dart';

final bottomNavs = [
  ViewModeWidget2(),
  // ArtEditMode(),
  CategoryMode(),
];

// class MyMainPage extends StatelessWidget {
//   const MyMainPage({Key? key, required this.title}) : super(key: key);
//   final String title;
//   static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         key: scaffoldKey,
//         appBar: customAppBar(context, title, scaffoldKey),
//         drawer: MainDrawer(),
//         bottomNavigationBar: BottomNavBar(),
//         body: Consumer<BottomNavBarController>(
//           builder: (BuildContext buildContext, controller, _) =>
//               bottomNavs[controller.index],
//         ),
//       ),
//     );
//   }
// }

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);
  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CommonUtils.doInFuture(() {
      context.read<CategoryListController>().getCategoryData();
      context.read<CategoryListController>().getPhotoData();
    });
    return SafeArea(
      child: Scaffold(
        key: MyMainPage.scaffoldKey,
        // appBar: customAppBar(context, title, scaffoldKey),
        // drawer: MainDrawer(),
        // bottomNavigationBar: BottomNavBar(),
        body: body(context),
      ),
    );
  }

  searchBox(VoidCallback voidCallback) {
    return Padding(
      padding: EdgeInsets.only(right: padding25),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade300,
        ),
        child: Consumer<CategoryListController>(
            builder: (context, catController, _) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    catController.searchTerm = value;
                  },
                  cursorColor: black38,
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: black26),
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    catController.searchTerm.isEmpty
                        ? Icons.search
                        : Icons.close_rounded,
                    color: black26,
                  ),
                  onPressed: () {
                    if (catController.searchTerm.isNotEmpty) {
                      catController.searchTerm = '';
                      _textController.clear();
                    }
                  }),
            ],
          );
        }),
      ),
    );
  }

  body(context) {
    return CommonBackgroundWithPainter(
      padding: EdgeInsets.only(left: padding25, right: 0, top: 8, bottom: 8),
      // stackFirstChildHeight: 175,
      // stackFirstChild: CustomPaint(
      //   painter: CurvePainter(),
      // ),
      children: [
        Text(appTitle, style: appTitleStyle()),
        SizedBox(height: 15),
        searchBox(() {}),
        SizedBox(height: 30),
        ViewModeWidget2(),
      ],
    );
  }
}
