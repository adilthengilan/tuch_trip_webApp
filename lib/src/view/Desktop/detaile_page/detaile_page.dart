import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Desktop/search_page/search_page.dart';
import 'package:tuch/utils/textstyles.dart';

class DetailePageDesktop extends StatelessWidget {
  const DetailePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'Tuchtrip',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.chat),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_2_outlined,
              size: height * 0.035,
              color: Colors.black,
            ),
          ),
          sizedbox(0.0, width * 0.02),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.white38,
              margin: EdgeInsets.symmetric(horizontal: width * 0.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<FeaturesProvider>(
                    builder: (context, feature, child) => 
                    Text(
                      'Location, ${feature.checkingDate}, 11 Night Guests ${feature.adults}, Rooms ${feature.rooms}',
                      style: GoogleFonts.montserrat(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  sizedbox(height * 0.01, 0.0),
                  Row(
                    children: [
                      Text(
                        'Burj Al Arab Jumeirah',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      sizedbox(0.0, width * 0.01),
                      StarRating(
                        height: height * 0.02,
                        rating: 4.8,
                        starCount: 5,
                      ),
                    ],
                  ),
                  Text('Dubai, United Emirites'),
                  sizedbox(height * 0.02, width),
                  Container(
                    height: height * 0.6,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/luxury hotel.jpg'),
                      ),
                    ),
                  ),
                  sizedbox(height * 0.006, width),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
