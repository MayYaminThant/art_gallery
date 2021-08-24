import '../controller/bottom_nav_bar_controller.dart';
import '../controller/category_list_controller.dart';
import '../ui/common_widget/common_widget.dart';
import '../ui/page/main_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyAppProvider());
}

class MyAppProvider extends StatelessWidget {
  const MyAppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomNavBarController(0),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryListController(0, categoryColor!),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  final String _title = 'Art Gallery';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MyMainPage(
        title: _title,
      ),
    );
  }
}
