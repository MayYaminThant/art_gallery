import '../../ui/menu/custom_app_bar.dart';
import '../../ui/page/view_mode.dart';

import '../../ui/menu/drawer.dart';
import 'package:flutter/material.dart';

import '../bottom_nav_bar.dart';

final bottomNavs = [
  ViewModeWidget(),
];

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: customAppBar(context, widget.title, scaffoldKey),
        drawer: MainDrawer(),
        bottomNavigationBar: BottomNavBar(),
        body: ViewModeWidget(),
      ),
    );
  }
}
