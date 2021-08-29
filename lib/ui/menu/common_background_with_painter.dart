import 'package:art_gallery/ui/common_widget/common_widget.dart';
import 'package:flutter/material.dart';

class CommonBackgroundWithPainter extends StatefulWidget {
  const CommonBackgroundWithPainter(
      {required this.children,
      required this.padding,
      this.stackFirstChild,
      this.stackFirstChildHeight,
      this.onTabCallback});

  final EdgeInsetsGeometry padding;
  final List<Widget> children;
  final Widget? stackFirstChild;
  final double? stackFirstChildHeight;
  final Function()? onTabCallback;
  @override
  _CommonBackgroundWithPainterState createState() =>
      _CommonBackgroundWithPainterState();
}

class _CommonBackgroundWithPainterState
    extends State<CommonBackgroundWithPainter> {
  Future<Null> _refreshCallback() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: RefreshIndicator(
        onRefresh: _refreshCallback,
        backgroundColor: grey800,
        color: Colors.white12,
        displacement: 165,
        strokeWidth: 3,
        child: SingleChildScrollView(
          child: InkWell(
            onTap: widget.onTabCallback,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: widget.stackFirstChildHeight,
                  child: widget.stackFirstChild,
                ),
                Padding(
                  padding: widget.padding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.children,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
