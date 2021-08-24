import 'package:flutter/material.dart';

class CategoryListController with ChangeNotifier {
  int _index;
  Color _selectedColor;

  CategoryListController(this._index, this._selectedColor);

  int get index => this._index;
  set index(int index) {
    if (this._index == index) {
      return;
    }
    this._index = index;
    notifyListeners();
  }

  Color get selectedColor => this._selectedColor;
  set selectedColor(Color colors) {
    if (colors == this._selectedColor) {
      return;
    }
    this._selectedColor = selectedColor;
    notifyListeners();
  }
}
