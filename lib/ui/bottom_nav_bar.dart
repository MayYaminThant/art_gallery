import '../../ui/common_widget/common_widget.dart';

import '../controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarController>(
      builder: (context, controller, _) => BottomNavigationBar(
        unselectedItemColor: unSelectedColor!,
        selectedItemColor: Colors.purple[500],
        currentIndex: controller.index,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          controller.index = index;
        },
        items: [
          _bottomNavBarItem(
            'View Mode',
            Icon(Icons.grid_view_outlined),
          ),
          _bottomNavBarItem(
            'Artor',
            Icon(Icons.face_retouching_natural),
          ),
          _bottomNavBarItem(
            'Data Edit',
            Icon(Icons.mode_edit),
          ),
          _bottomNavBarItem(
            'Category Edit',
            Icon(Icons.category),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavBarItem(String title, Icon icon) {
    return BottomNavigationBarItem(
      label: title,
      icon: icon,
    );
  }
}
