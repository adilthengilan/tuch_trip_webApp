import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/bookingProvider.dart';
import 'package:tuch/src/view%20model/calender_provider.dart';
import 'package:tuch/src/view%20model/dashboard_provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view%20model/search_provider.dart';
import 'package:tuch/src/view%20model/hotel_provider.dart';
import 'package:tuch/src/view%20model/hotel_details_provider.dart';
import 'package:tuch/src/view%20model/room_provider.dart';

List<ChangeNotifierProvider<ChangeNotifier>> providers = [
  ChangeNotifierProvider<DashBoardProvider>(create: (context) => DashBoardProvider()),
  ChangeNotifierProvider<SearchProvider>(create: (context) => SearchProvider()),
  ChangeNotifierProvider<CalendarProvider>(
      create: (context) => CalendarProvider()),
  ChangeNotifierProvider<FeaturesProvider>(
      create: (context) => FeaturesProvider()),
  ChangeNotifierProvider<FeaturesProvider>(create: (context) => FeaturesProvider()),
  ChangeNotifierProvider<HotelProvider>(create: (context) => HotelProvider()),
  ChangeNotifierProvider<HotelDetailProvider>(
      create: (context) => HotelDetailProvider()),
  ChangeNotifierProvider<RoomProvider>(create: (context) => RoomProvider()),
  ChangeNotifierProvider<BookingModel>(create: (context) => BookingModel()),
  ChangeNotifierProvider<ReviewProvider>(create: (context) => ReviewProvider()),
  ChangeNotifierProvider<HotelDetailProvider>(create: (context) => HotelDetailProvider()),
  ChangeNotifierProvider<RoomProvider>(create: (context) => RoomProvider()),
  ChangeNotifierProvider<BookingModel>(create: (context) => BookingModel()),
  ChangeNotifierProvider<ReviewProvider>(create: (context) => ReviewProvider()),
];
