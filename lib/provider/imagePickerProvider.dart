import 'package:flutter/material.dart';
import 'dart:io';
class ImagePickerProvider extends ChangeNotifier {
  String? _imagePath;
  String? get imagePath => _imagePath;
  void setImagePath(String path) {
    _imagePath = path;
    notifyListeners();
  }
  void clearImage() {
    _imagePath = null;
    notifyListeners();
  }
}