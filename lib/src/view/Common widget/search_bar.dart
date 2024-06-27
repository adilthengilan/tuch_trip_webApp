import 'package:flutter/material.dart';
import 'package:tuch/utils/textstyles.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged? onChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final double width;
  final double height;
  const AppSearchBar({
    super.key,
    this.controller,
    required this.hintText,
    required this.width,
    required this.height,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.065,
      width: width ,
      margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 4),
            blurRadius: 3,
            color: Color.fromARGB(47, 80, 79, 79),
          ),
          BoxShadow(
            offset: Offset(-2, -1),
            blurRadius: 3,
            color: Color.fromARGB(255, 216, 216, 216),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: smallTextStyle,
          contentPadding: EdgeInsets.all(height * 0.015),
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              top: height * 0.006,
              left: width * 0.04,
              right: width * 0.02,
            ),
            child: prefixIcon
          ),
        ),
      ),
    );
  }
}