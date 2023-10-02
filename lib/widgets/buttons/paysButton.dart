import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypotenuse/viewmodel/pricingPage_viewModel.dart';
import 'package:provider/provider.dart';

Widget GetPayButton(BuildContext context) {
  var proViewModel = Provider.of<PricingPageViewModel>(context);
  if (Platform.isIOS) {
    return CupertinoButton(
      onPressed: () {
        proViewModel.buttonValidation();
      },
      color: CupertinoColors.activeBlue,
      child: const Text(
        Strings.pay,
        style: TextStyle(fontSize: 17.0),
      ),
    );
  } else {
    return ElevatedButton(
      onPressed: () {
        proViewModel.buttonValidation();
      },
      child: Text(
        Strings.pay.toUpperCase(),
        style: const TextStyle(fontSize: 17.0),
      ),
    );
  }
}

class Strings {
  static const String appName = 'Payment Card Demo';
  static const String fieldReq = 'This field is required';
  static const String numberIsInvalid = 'Card is invalid';
  static const String pay = 'Validate';
}
