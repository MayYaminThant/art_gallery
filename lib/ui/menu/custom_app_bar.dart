import '../../ui/common_widget/common_widget.dart';
import '../../ui/common_widget/curve_painter.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(context, title, GlobalKey<ScaffoldState> key) {
  final double height = 80;
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, height + 0),
    child: Container(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: height,
            child: CustomPaint(
              painter: CurvePainter(),
            ),
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 13,
                child: IconButton(
                  onPressed: () {
                    if (key.currentState != null) {
                      key.currentState!.openDrawer();
                    }
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(child: Text(title, style: appTitleStyle())),
            ],
          ),
        ],
      ),
    ),
  );
}
