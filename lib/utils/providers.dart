import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/calender_provider.dart';
import 'package:tuch/src/view%20model/dashboard_provider.dart';
import 'package:tuch/src/view%20model/feauture_provider.dart';
import 'package:tuch/src/view%20model/search_provider.dart';

List<ChangeNotifierProvider<ChangeNotifier>> providers = [
  ChangeNotifierProvider<DashBoardProvider>(
      create: (context) => DashBoardProvider()),
  ChangeNotifierProvider<SearchProvider>(create: (context) => SearchProvider()),
  ChangeNotifierProvider<CalendarProvider>(
      create: (context) => CalendarProvider()),
        ChangeNotifierProvider<DashBoardProvider>(
      create: (context) => DashBoardProvider()),
              ChangeNotifierProvider<SearchProvider>(
      create: (context) => SearchProvider()),
       ChangeNotifierProvider<FeaturesProvider>(
      create: (context) => FeaturesProvider()),



];
