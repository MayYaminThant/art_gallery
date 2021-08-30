import 'package:flutter/material.dart';

class PhotoDetailController with ChangeNotifier {
  PhotoDetailController(this._isShowDetail);
  bool _isShowDetail;
  bool get isShowDetail => _isShowDetail;

  set isShowDetail(bool isShowDetail) {
    if (isShowDetail == this._isShowDetail) {
      return;
    }
    this._isShowDetail = isShowDetail;
    notifyListeners();
  }
}
