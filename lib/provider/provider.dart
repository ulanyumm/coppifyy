import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDataProvider extends ChangeNotifier {
  bool _dataAvailable = false;

  bool get isDataAvailable => _dataAvailable;

  void setDataAvailability(bool value) {
    _dataAvailable = value;
    notifyListeners();
  }
}
