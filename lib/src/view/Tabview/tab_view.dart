import 'package:flutter/material.dart';
import 'package:tuch/src/view/Tabview/home_page.dart';

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
