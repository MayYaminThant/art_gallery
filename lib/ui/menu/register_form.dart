import '../../controller/user_auth_controller.dart';
import '../../ui/menu/sign_in_form.dart';
import '../../ui/common_widget/common_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _displayNameController = TextEditingController();

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
                    'Hello!',
                    style: loginTitleStyle(),
                  ),
                  Text(
                    'Signup to',
                    style: loginTitleStyle(),
                  ),
                  Text(
                    'get started',
                    style: loginTitleStyle(),
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
        _displayNameController,
        loginTextFeildDecoration().copyWith(
          hintText: 'User Name',
        ),
        (value) {
          if (value!.isEmpty) {
            return 'Enter your user name';
          }
          return null;
        },
      ),
      sizeBoxBetweenColumnCells,
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
          child: Text('Save'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await stateController.registerAccount(
                  _emailController.text,
                  _displayNameController.text,
                  _passwordController.text,
                  (e) =>
                      showErrorDialog(context, 'Failed to create account', e));
              if (stateController.loginState ==
                  ApplicationLoginState.emailAddress) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (bContext) => SignInForm()),
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
            stateController.loginState = ApplicationLoginState.emailAddress;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (bContext) => SignInForm()),
                (route) => false);
          },
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Already have an account?',
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
