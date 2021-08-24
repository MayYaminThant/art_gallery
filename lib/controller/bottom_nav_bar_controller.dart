import 'package:flutter/material.dart';

final categoryLst = [
  'Painting',
  'Modern Art',
  'Painting',
  'Wallpaper',
  'Nature',
  'Painting',
  'Anime',
  '3D',
];

final galleryLst = [
  'assets/image/codelab.png',
  'assets/image/codelab.png',
  'assets/image/codelab.png',
  'assets/image/codelab.png',
  'assets/image/codelab.png',
  'assets/image/codelab.png',
];

class BottomNavBarController with ChangeNotifier {
  BottomNavBarController(this._index);

  int _index;

  int get index => this._index;

  set index(int index) {
    if (this._index == index) {
      return;
    }
    this._index = index;
    notifyListeners();
  }
}
