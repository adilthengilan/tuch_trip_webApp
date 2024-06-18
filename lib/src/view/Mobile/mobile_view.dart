import 'package:flutter/material.dart';
import 'package:tuch/src/view/Mobile/Home/home_page.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return MobileViewHome();
  }
}
