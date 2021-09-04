import '../../controller/user_auth_controller.dart';
import '../../ui/menu/register_form.dart';
import '../../ui/page/main_page.dart';
import '../../ui/common_widget/common_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 2, end: 1),
            duration: Duration(seconds: 1),
            builder: (context, scale, child) {
              return Transform.scale(scale: scale as double, child: child);
            },
            child: Column(
              children: [
                getLoginHeaderUI(context, [
                  Text(
                    'Hello Again!',
                    style: getTitleStyle(black45!),
                  ),
                  Text(
                    'Welcome',
                    style: getTitleStyle(black45!),
                  ),
                  Text(
                    'back',
                    style: getTitleStyle(black45!),
                  ),
                ]),
                Consumer<AuthStateController>(
                  builder: (context, stateController, _) => loginParentBody(
                    _formKey,
                    stateController.errorString != null &&
                            stateController.errorString!.isNotEmpty
                        ? stateController.errorString
                        : null,
                    children,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get children {
    return [
      commonLoginTextFeild(
        _emailController,
        loginTextFeildDecoration(),
        (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your email address to continue';
          }
          return null;
        },
      ),
      sizeBoxBetweenColumnCells,
      commonLoginTextFeild(
        _passwordController,
        loginTextFeildDecoration().copyWith(
          hintText: 'Password',
        ),
        (value) {
          if (value!.isEmpty) {
            return 'Enter your password';
          }
          return null;
        },
      ),
      sizeBoxBetweenColumnCells,
      Consumer<AuthStateController>(
        builder: (bContext, stateController, _) => StyledButton(
          child: const Text('Sign In'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await stateController.signInWithEmailAndPassword(
                  _emailController.text,
                  _passwordController.text,
                  (e) => showErrorDialog(context, 'Failed to sign in', e));
              if (stateController.loginState ==
                  ApplicationLoginState.loggedIn) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (bContext) => MyMainPage()),
                    (route) => false);
              }
            }
          },
        ),
      ),
      sizeBoxBetweenColumnCells,
      sizeBoxBetweenColumnCells,
      Consumer<AuthStateController>(
        builder: (context, stateController, _) => InkWell(
          onTap: () {
            stateController.errorString = '';
            stateController.loginState = ApplicationLoginState.register;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (bContext) => RegisterForm()),
                (route) => false);
          },
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Don\'t have an account?',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
