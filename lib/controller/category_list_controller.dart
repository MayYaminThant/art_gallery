import '../ui/common_widget/common_widget.dart';
import '../model/category.dart';
import '../model/photo.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class CategoryListController with ChangeNotifier {
  int _index;
  bool _isPhotoView;
  Color _selectedColor;

  List<Photo> _photoLst = [];
  List<Photo> get photoLst => _photoLst;

  List<Photo> _photoLstByCatID = [];
  List<Photo> get photoLstByCatID => _photoLstByCatID;

  List<Photo> _filterPhotoLst = [];
  List<Photo> get filterPhotoLst => _filterPhotoLst;

  List<Category> _categoryLst = [];
  List<Category> get categoryLst => _categoryLst;

  String _searchTerm;

  String get searchTerm => _searchTerm;

  set searchTerm(String searchTerm) {
    if (_searchTerm == searchTerm) return;

    _searchTerm = searchTerm;
    setFilterPhotoLst();

    notifyListeners();
  }

  Photo _photo = newPhoto;
  Photo get photo => _photo;
  set photo(Photo photo) {
    if (photo == _photo) {
      return;
    }
    _photo = photo;
    notifyListeners();
  }

  CategoryListController(
      this._index, this._selectedColor, this._isPhotoView, this._searchTerm);

  int get index => this._index;
  set index(int index) {
    if (this._index == index) {
      return;
    }
    this._index = index;
    getPhotoDataByCatID();
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

  Future<void> getPhotoData() async {
    _photoLst = [];
    _filterPhotoLst = [];
    notifyListeners();
    FirebaseFirestore.instance
        .collection('photo')
        .orderBy("created_date", descending: true)
        .get()
        .then((QuerySnapshot snapshot) {
      _photoLst = [];
      _filterPhotoLst = [];
      snapshot.docs.forEach((element) async {
        final ref = FirebaseStorage.instance
            .ref()
            .child(element.data()['photo_url'].split('/').last);
        var url = await ref.getDownloadURL();
        // no need of the file extension, the name will do fine.
        Photo item = await setPhotoData(element.data(), url);
        var existingItem = _photoLst.firstWhere(
            (itemToCheck) => item.isEqual(itemToCheck),
            orElse: () => newPhoto);
        if (existingItem.isEqual(newPhoto)) {
          _photoLst.add(item);
          setFilterPhotoLst();
        }
        notifyListeners();
      });
      print(_photoLst);
    });
  }

  setPhotoData(Map<String, dynamic> data, var url) {
    var createdDate;
    var createdDateParse;
    var value = data['created_date'];
    if (value != null) {
      createdDate = data['created_date'].toDate().toString();
      createdDateParse = DateFormat(dateFormat).parse(createdDate);
    }
    var createdDateFormat =
        value != null ? DateFormat(dateFormat).format(createdDateParse) : '';

    var modifiedDate;
    var modifiedDateParse;
    value = data['modified_date'];
    if (value != null) {
      modifiedDate = value.toDate().toString();
      modifiedDateParse = DateFormat(dateFormat).parse(modifiedDate);
    }
    var modifiedDateFormat =
        value != null ? DateFormat(dateFormat).format(modifiedDateParse) : '';
    Photo item = Photo(
      photoId: data['photo_id'],
      photoName: data['photo_name'],
      photoUrl: url,
      categoryId: data['category_id'],
      price: double.parse(data['price'].toString()),
      categoryName: categoryName(data['category_id']),
      createdDate: createdDateFormat,
      modifiedDate: modifiedDateFormat,
      artistId: data['artist_id'],
    );
    return item;
  }

  Future<void> getPhotoDataByCatID() async {
    _photoLstByCatID = [];
    notifyListeners();
    await FirebaseFirestore.instance
        .collection('photo')
        .where('category_id', isEqualTo: categoryLst[index].categoryId)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) async {
        final ref = FirebaseStorage.instance
            .ref()
            .child(element.data()['photo_url'].split('/').last);
        // no need of the file extension, the name will do fine.
        var url = await ref.getDownloadURL();
        Photo item = await setPhotoData(element.data(), url);
        var existingItem = _photoLstByCatID.firstWhere(
            (itemToCheck) => item.isEqual(itemToCheck),
            orElse: () => newPhoto);
        if (existingItem.isEqual(newPhoto)) {
          _photoLstByCatID.add(item);
        }
        notifyListeners();
      });
      print('Photo Length ${_photoLstByCatID.length}');
    });
  }

  Future<void> getCategoryData() async {
    _categoryLst = [];
    notifyListeners();
    FirebaseFirestore.instance
        .collection('category')
        .orderBy('created_date')
        .get()
        .then((QuerySnapshot snapshot) {
      _categoryLst = [];
      snapshot.docs.forEach((element) {
        _categoryLst.add(
          Category(
            categoryId: element.data()['category_id'],
            categoryName: element.data()['category_name'],
          ),
        );
      });
      if (categoryLst.isNotEmpty) {
        index = 0;
      }
      notifyListeners();
    });
    print(_categoryLst);
  }

  String categoryName(String catID) {
    for (var category in _categoryLst) {
      if (category.categoryId == catID) {
        return category.categoryName;
      }
    }
    return '';
  }

  bool get isPhotoView => this._isPhotoView;

  set isPhotoView(bool isPhotoView) {
    if (isPhotoView == this._isPhotoView) {
      return;
    }
    this._isPhotoView = isPhotoView;
    notifyListeners();
  }

  setFilterPhotoLst() {
    if (searchTerm.isEmpty) {
      _filterPhotoLst = _photoLst;
      notifyListeners();
    } else {
      _filterPhotoLst = [];
      notifyListeners();
      for (Photo item in photoLst) {
        if (item.photoName.toLowerCase().contains(searchTerm.toLowerCase()) ||
            item.categoryName
                .toLowerCase()
                .contains(searchTerm.toLowerCase())) {
          _filterPhotoLst.add(item);
        }
      }
      notifyListeners();
    }
  }
}
