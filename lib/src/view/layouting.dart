import 'package:flutter/material.dart';
import 'package:tuch/src/view/Desktop/desktopview.dart';
import 'package:tuch/src/view/Mobile/mobile_view.dart';
import 'package:tuch/src/view/Tabview/tab_view.dart';
import 'package:tuch/src/view/responsive_layour.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          DesktopView: DesktopView(),
          MobileViews: MobileView(),
          TabView: TabView()),
    );
  }
}
