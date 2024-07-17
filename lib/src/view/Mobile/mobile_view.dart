import 'package:flutter/material.dart';
import 'package:tuch/src/view/Mobile/Home/mobile_view_body.dart';
import 'package:lottie/lottie.dart';

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

class UnderMaintanancePage extends StatelessWidget {
  const UnderMaintanancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: LottieBuilder.asset(
              'assets/animation/Animation - 1720502803876.json'),
        ),
      ),
    );
  }
}
