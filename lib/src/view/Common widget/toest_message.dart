import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:flutter/material.dart';

void toastmessege(messege) {
  Fluttertoast.showToast(
    msg: messege,
    timeInSecForIosWeb: 4,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.white,
    textColor: backgroundColor
  );
}