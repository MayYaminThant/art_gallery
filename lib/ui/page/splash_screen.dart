import '../../controller/user_auth_controller.dart';
import '../../ui/common_widget/common_widget.dart';
import '../../ui/menu/register_form.dart';
import '../../ui/menu/sign_in_form.dart';
import '../../ui/page/main_page.dart';
import '../../util/common_util.dart';
import '../../util/screen_size_util.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    CommonUtils.doInFuture(
      () {
        Future.delayed(
          Duration(seconds: 4),
          () async {
            ApplicationLoginState loginState =
                await context.read<AuthStateController>().init();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (bContext) =>
                    (loginState == ApplicationLoginState.loggedIn)
                        ? MyMainPage()
                        : (loginState == ApplicationLoginState.register
                            ? RegisterForm()
                            : SignInForm()),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _getLoginHeader(),
      ),
    );
  }

  _getLoginHeader() {
    double height = ScreenSizeUtil.screenHeight(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: _backgroundDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image(height),
            sizeBoxBetweenColumnCells,
            _animatedTextKit()
          ],
        ),
      ),
    );
  }

  BoxDecoration _backgroundDecoration() {
    return BoxDecoration(
      color: black45,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black,
          Colors.black87,
        ],
      ),
    );
  }

  Center _image(double height) {
    return Center(
      child: Hero(
        tag: 'splashScreen',
        child: Container(
          child: Image.asset('assets/image/art_gallery_landscape-removebg.png'),
          height: height * 0.35,
        ),
      ),
    );
  }

  Container _animatedTextKit() {
    return Container(
      height: 70,
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            'Let\'s Get Started!',
            textStyle: colorizeBigTextStyle,
            colors: colorizeColors,
            speed: Duration(milliseconds: 100),
          ),
          RotateAnimatedText(
            'Surprises await you.',
            textStyle: colorizeSmallTextStyle,
          ),
        ],
        isRepeatingAnimation: true,
      ),
    );
  }

  get colorizeBigTextStyle => GoogleFonts.dmSerifDisplay(
        fontSize: 30,
        letterSpacing: 3,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      );

  get colorizeSmallTextStyle => GoogleFonts.dmSerifDisplay(
        fontSize: 20,
        color: Colors.black,
        letterSpacing: 2,
      );

  get colorizeColors => [
        Colors.white,
        Colors.black,
        Colors.white,
        Colors.black,
      ];
}
