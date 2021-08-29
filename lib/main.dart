import 'package:art_gallery/controller/photo_detail_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:photo_view/photo_view.dart';

import '../controller/bottom_nav_bar_controller.dart';
import '../controller/category_list_controller.dart';
import '../ui/common_widget/common_widget.dart';
import '../ui/page/main_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          create: (_) => CategoryListController(-1, categoryColor!, false, ''),
        ),
        ChangeNotifierProvider(
          create: (_) => PhotoDetailController(true),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.sarabunTextTheme(textTheme)),
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: MyMainPage(),
    );
  }
}
