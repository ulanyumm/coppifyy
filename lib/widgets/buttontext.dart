import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/instagram_viewmodel.dart';

Widget buildButtonChild(InstagramViewModel viewModel) {
  if (viewModel.isLoading) {
    return CircularProgressIndicator();
  } else {
    return Text(
      'Generate',
      style: UIHelper.getButtonTextStyle(),
    );
  }
}
