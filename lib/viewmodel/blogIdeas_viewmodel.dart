import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogIdeasViewModel extends ChangeNotifier {
  TextEditingController blogAbout = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formkey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
}
