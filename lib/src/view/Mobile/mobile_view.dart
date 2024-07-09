import 'package:flutter/material.dart';
import 'package:tuch/src/view/Mobile/Home/Booking/booking.dart';
import 'package:tuch/src/view/Mobile/Home/Hotel%20Details/hotel_details.dart';
import 'package:tuch/src/view/Mobile/Home/mobile_view_body.dart';
import 'package:tuch/src/view/constants/b2b_solutions.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return MobileViewBody();
  }
}
