import '../controller/photo_detail_controller.dart';
import '../controller/category_list_controller.dart';
import '../../controller/password_visibility_controller.dart';
import '../controller/user_auth_controller.dart';
import '../ui/common_widget/common_widget.dart';
import '../ui/page/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

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
          create: (_) => CategoryListController(-1, categoryColor!, false, ''),
        ),
        ChangeNotifierProvider(
          create: (_) => PhotoDetailController(true),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthStateController(),
        ),
        ChangeNotifierProvider(
          create: (_) => PasswordVisibilityController(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.sarabunTextTheme(textTheme)),
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
