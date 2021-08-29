import 'package:flutter/material.dart';

class AnimateRightToLeft extends StatelessWidget {
  final bool visible;
  final Widget body;
  final Widget child;

  const AnimateRightToLeft({
    Key? key,
    required this.visible,
    required this.body,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: body,
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          alignment: visible ? Alignment.center : Alignment.centerRight,
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: visible ? 1.0 : 0.0,
            child: child,
          ),
        ),
      ],
    );
  }
}