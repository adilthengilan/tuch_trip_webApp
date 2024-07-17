import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Desktop/Search/searchPage.dart';
import 'package:tuch/src/view/Mobile/Home/Sign%20in/sign_in.dart';
import 'package:tuch/utils/textstyles.dart';

class HomePageDeskTop extends StatefulWidget {
  const HomePageDeskTop({super.key});

  @override
  State<HomePageDeskTop> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageDeskTop> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<FeaturesProvider>(
      builder: (context, sheets, child) => GestureDetector(
        onTap: () {
          sheets.disposeAllSheets();
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Tuchtrip', style: heading),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person_2_outlined,
                  size: height * 0.035,
                  color: Colors.white,
                ),
              ),
              sizedbox(0.0, width * 0.02),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedbox(height * 0.25, width),

                ///===========================================================================================================================
                //===================================================== Home Seach Bar ======================================================
                ///===========================================================================================================================
                Text('Tuchtrip Travel Service', style: largeHeadings),
                sizedbox(height * 0.2, 0.0),
                // SearchingBar(height: height, width: width),
                sizedbox(height * 0.3, width),
                Text('Your', style: largeHeadings),
                SizedBox(
                  width: width * 0.6,
                  child: Text(
                    'booking experience',
                    style: largeHeadings,
                    textAlign: TextAlign.center,
                  ),
                ),
                //===============================================================================================================================
                //===============================================================================================================================
                sizedbox(height * 0.03, width),
                //================================================= App Introduction ============================================================
                //===============================================================================================================================
                //========================================= Smart Check-In ===== Face Authentication ============================================
                //===============================================================================================================================
                Container(
                  height: height * 0.45,
                  width: width * 0.8,
                  padding: EdgeInsets.only(left: width * 0.01, top: height * 0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/luxury hotel.jpg'),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Explore Our Luxury Stays', style: largeboldstyle),
                      SizedBox(
                        width: width * 0.45,
                        child: Text(
                          'Travel the world with our broad selection of stays,'
                          ' offering unique and luxurious accommodations tailored to suit every traveler’s needs and preferences.',
                          style: smallTextstylewhite,
                        ),
                      ),
                    ],
                  ),
                ),
                sizedbox(height * 0.04, width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.46,
                      width: width * 0.39,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade900,
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/smartcheking.png'),
                        ),
                      ),
                    ),
                    sizedbox(0.0, width * 0.02),
                    Container(
                      height: height * 0.46,
                      width: width * 0.39,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade900,
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              AssetImage('assets/images/smart_door_unlock.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                //===============================================================================================================================
                //===============================================================================================================================
                sizedbox(height * 0.3, width),
                ////=============================================================================================================================
                //=============================================== Loyality Program ==============================================================
                //===============================================================================================================================
                //===============================================================================================================================
                Container(
                  height: height * 0.7,
                  width: width * 0.5,
                  padding: EdgeInsets.only(bottom: height * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/loyalty.png'),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Your own Loyality Program',
                        style: largeHeadings,
                      ),
                      sizedbox(height * 0.005, 0.0),
                      SizedBox(
                        width: width * 0.4,
                        child: Text(
                          'Discover Coins and earn digital and physical rewards.'
                          ' Invite friends to collect Coins collectibles and increase your rewards.',
                          style: smallTextstylewhite,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                sizedbox(height * 0.03, width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              minimumSize: Size(width * 0.2, height * 0.07),
                              backgroundColor: index == 0
                                  ? Colors.purpleAccent
                                  : Colors.white),
                          onPressed: () {},
                          child: Text(
                            // The First button Show the Invite Friends Text To First Button
                            // Second Button is Join Program
                            index == 0 ? 'Invite Friends' : 'Join Program',
                            style: smallTextStyle,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //===============================================================================================================================
                //===============================================================================================================================
                sizedbox(height * 0.3, width),
                //===============================================================================================================================
                //====================================== App Link Button and QR Code of the Mobile Application ==================================
                //===============================================================================================================================
                //================================================= Play Store And App Store ====================================================
                //===============================================================================================================================
                SizedBox(
                  height: height * 0.65,
                  width: width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //===================================== Heading ===============================================================
                          Text('Innovative', style: largeHeadings),
                          //===================================== Heading ===============================================================
                          Text(
                            'Booking App',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 54,
                                fontWeight: FontWeight.w400),
                          ),
                          sizedbox(height * 0.01, 0.0),
                          //===================================== Heading ===============================================================
                          Text('Change The way you Travel',
                              style: mediumtextstyle),
                          sizedbox(height * 0.08, 0.0),
                          Row(
                            children: List.generate(
                              2,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: width * 0.02),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: height * 0.08,
                                    width: width * 0.14,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.008,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 255, 176, 248),
                                          Color.fromARGB(255, 105, 227, 255),
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: height * 0.06,
                                          width: width * 0.028,
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage(index == 0
                                                ? 'assets/images/googlePlayStore.png'
                                                : 'assets/images/appleStore.png'),
                                          ),
                                        ),
                                        sizedbox(width * 0.02, 0.0),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'GET IT ON',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            //======================== google Play============ Store and App Store ====================================
                                            Text(
                                              index == 0
                                                  ? 'Google Play'
                                                  : 'App Store',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //======================================== QR Code ==========================================================================
                      Container(
                        height: height * 0.45,
                        width: width * 0.23,
                        margin: EdgeInsets.only(right: width * 0.01),
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.4,
                          horizontal: width * 0.08,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/QrCode.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //=========================================== Heading ========================================================================
                sizedbox(height * 0.25, width),
                Text(
                  'Choose Your Next\nDestination',
                  style: largeHeadings,
                  textAlign: TextAlign.center,
                ),
                sizedbox(height * 0.04, width),
                //==============================================  Choose Your Destinations ======================================================
                //===============================================================================================================================
                //============================== Dubai ===== Germany ==== United Kingdom ==== Thailand ==== Paris ===============================
                //===============================================================================================================================
                chooseYourDestinationsCountries(width, height),
                //===============================================================================================================================
                sizedbox(height * 0.3, width),
                //===============================================================================================================================
                //======================================== About Us =============================================================================
                //===============================================================================================================================
                aboutUsContainer(width, height),
                //===============================================================================================================================
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding chooseYourDestinationsCountries(double width, double height) {
    List images = [
      'assets/images/Dubai.png',
      'assets/images/germany.png',
      'assets/images/uk.jpeg',
      'assets/images/thailand.png',
      'assets/images/paris.png',
    ];
    List<String> destinations = [
      'Dubai',
      'Germany',
      'United Kingdom',
      'Thailand',
      'Paris',
    ];
    List<VoidCallback> onTap = [
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPageDeskTop(),
            ));
      },
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPageDeskTop(),
            ));
      },
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPageDeskTop(),
            ));
      },
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPageDeskTop(),
            ));
      },
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPageDeskTop(),
            ));
      },
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          5,
          (index) => Column(
            children: [
              InkWell(
                onTap: onTap[index],
                child: ClipOval(
                  child: Container(
                    height: height * 0.53,
                    width: width * 0.16,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(images[index]),
                      ),
                    ),
                  ),
                ),
              ),
              sizedbox(height * 0.02, 0.0),
              Text(destinations[index], style: smallTextstylewhite),
            ],
          ),
        ),
      ),
    );
  }

  Container aboutUsContainer(double width, double height) {
    List policiesList = [
      'About us',
      'Contacts',
      'Faq',
      'User Agreement',
      'Privacy policy',
      'Coockies Policy',
    ];
    return Container(
      width: width,
      height: height * 0.38,
      margin: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tuchtrip', style: heading),
              sizedbox(height * 0.05, 0.0),
              Row(
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: width * 0.03),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        policiesList[index],
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: height * 0.017),
                      ),
                    ),
                  ),
                ),
              ),
              sizedbox(height * 0.05, 0.0),
              Text(
                  '© 2024 ONLINE Booking And Checking SOLUTIONS - FZCO. All rights reserved.',
                  style: smallTextstylewhite),
              sizedbox(height * 0.015, 0.0),
              SizedBox(
                width: width * 0.45,
                child: Text(
                  'The contents of this website are protected by copyright.'
                  'No part of this website may be copied, used, distributed, or modified without permission.'
                  'Touchtrip is not responsible for the content of any external websites.',
                  style: GoogleFonts.poppins(color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
          Container(
            height: height * 0.14,
            width: width * 0.12,
            margin: EdgeInsets.only(top: height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) {
                  List<String> socialMedia = [
                    'assets/images/Instagram_Icon.png',
                    'assets/images/Fb_Icon.png',
                    'assets/images/LinkedIn_Icon.png',
                  ];
                  return CircleAvatar(
                    radius: height * 0.03,
                    backgroundColor: Colors.grey.shade900,
                    child: Padding(
                      padding: EdgeInsets.all(height * 0.01),
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(socialMedia[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
