import 'package:flutter/material.dart';

showMessage(BuildContext contextx, String message) {
  SnackBar snackBar = SnackBar(
    content: Text(message),
  );
  ScaffoldMessenger.of(contextx).showSnackBar(snackBar);
}
