import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuch/utils/app_colors.dart';

void toastmessege(messege) {
  Fluttertoast.showToast(
    msg: messege,
    timeInSecForIosWeb: 4,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    textColor: backgroundColor
  );
}