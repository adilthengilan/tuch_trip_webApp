import 'package:flutter/material.dart';
import 'package:tuch/src/view/Tabview/Home/tab_view_body.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return TabViewHome();
  }
}
