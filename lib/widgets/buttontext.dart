import 'package:flutter/material.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/ads&social/InstagramCaptions/instagram_viewmodel.dart';

Widget buildButtonChild(InstagramViewModel viewModel) {
  if (viewModel.isLoading) {
    return const CircularProgressIndicator();
  } else {
    return Text(
      'Generate',
      style: UIHelper.getButtonTextStyle(),
    );
  }
}
