import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastSuccess(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green[700],
      textColor: Colors.white
  );
}