import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';
import 'package:table_calendar/table_calendar.dart';

TextEditingController locationController = TextEditingController();
bool locationSearchingList = false;
bool calendarPicker = false;
bool roomsCounter = false;

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _HomePageState();
}

class _HomePageState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          locationSearchingList = false;
          calendarPicker = false;
          roomsCounter = false;
        });
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
              Text('Tuchtrip Travel Service', style: largeHeadings),
              sizedbox(height * 0.2, 0.0),
              SearchBar(height: height, width: width),
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
              sizedbox(height * 0.03, width),
              Container(
                height: height * 0.45,
                width: width * 0.8,
                padding: EdgeInsets.only(left: width * 0.01, top: height * 0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
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
                        'Travel the world with our broad selection of stays, offering unique and luxurious accommodations tailored to suit every traveler’s needs and preferences.',
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
                        color: Colors.blue,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('assets/images/smartcheking.png'))),
                  ),
                  sizedbox(0.0, width * 0.02),
                  Container(
                    height: height * 0.46,
                    width: width * 0.39,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            AssetImage('assets/images/smart_door_unlock.png'),
                      ),
                    ),
                  ),
                ],
              ),
              sizedbox(height * 0.3, width),
              Container(
                height: height * 0.7,
                width: width * 0.5,
                padding: EdgeInsets.only(bottom: height * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
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
                        'Discover Coins and earn digital and physical rewards. Invite friends to collect Coins collectibles and increase your rewards.',
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
                          index == 0 ? 'Invite Friends' : 'Join Program',
                          style: smallTextStyle,
                        ),
                      ),
                    );
                  },
                ),
              ),
              sizedbox(height * 0.3, width),
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
                        Text('Innovative', style: largeHeadings),
                        Text(
                          'Booking App',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 54,
                              fontWeight: FontWeight.w400),
                        ),
                        Text('Change The way you Travel',
                            style: mediumtextstyle),
                        sizedbox(height * 0.08, 0.0),
                        Row(
                          children: List.generate(
                            2,
                            (index) => InkWell(
                              onTap: () {},
                              child: Container(
                                height: height * 0.08,
                                width: width * 0.12,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.008),
                                margin: EdgeInsets.only(right: width * 0.01),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 163, 238, 255),
                                      Color.fromARGB(255, 252, 215, 249),
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
                                        Text(
                                          'Google Play',
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
                      ],
                    ),
                    Container(
                      height: height * 0.45,
                      width: width * 0.23,
                      margin: EdgeInsets.only(right: width * 0.01),
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.4,
                        horizontal: width * 0.08,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/QrCode.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              sizedbox(height * 0.25, width),
              Text(
                'Choose Your Next\nDestination',
                style: largeHeadings,
                textAlign: TextAlign.center,
              ),
              sizedbox(height * 0.04, width),
              chooseYourDestinationsCountries(width, height),
              sizedbox(height * 0.3, width),
              aboutUsContainer(width, height),
            ],
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          5,
          (index) => Column(
            children: [
              ClipOval(
                child: Container(
                  height: height * 0.53,
                  width: width * 0.16,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(images[index]),
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
      height: height * 0.4,
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
                    padding: EdgeInsets.only(right: width * 0.02),
                    child:
                        Text(policiesList[index], style: smallTextstylewhite),
                  ),
                ),
              ),
              sizedbox(height * 0.05, 0.0),
              Text(
                  '© 2024 ONLINE Booking SOLUTIONS - FZCO. All rights reserved.',
                  style: mediumtextstyle),
              sizedbox(height * 0.03, 0.0),
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
            height: height * 0.01,
            width: width * 0.2,
            color: Colors.blueAccent,
            margin: EdgeInsets.only(top: height * 0.04),
            child: Row(
              children: List.generate(
                3,
                (index) {
                  List <String> socialMedia = []; 
                  return CircleAvatar(
                    radius: height * 0.02,
                    backgroundImage: AssetImage(socialMedia[index]),
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

class SearchBar extends StatefulWidget {
  final double height;
  final double width;
  const SearchBar({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    // ======================================================== Search Bar ==========================================================
    return Container(
      width: widget.width * 0.8,
      height: locationSearchingList || calendarPicker || roomsCounter
          ? widget.height * 0.6
          : widget.height * 0.08,
      padding: EdgeInsets.symmetric(horizontal: widget.width * 0.005),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: widget.height * 0.065,
                width: widget.width * 0.7,
                padding: EdgeInsets.only(left: widget.width * 0.005),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 163, 238, 255),
                      Color.fromARGB(255, 252, 215, 249),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    //===================================================== Location searcher =====================================================
                    Container(
                      width: widget.width * 0.3,
                      child: Consumer<FeaturesProvider>(
                        builder: (context, feature, child) => TextField(
                          onTap: () {
                            setState(() {
                              locationSearchingList = !locationSearchingList;
                              calendarPicker = false;
                              roomsCounter = false;
                            });
                          },
                          controller: locationController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Where would you like to go?',
                            hintStyle: smallTextStyle,
                            contentPadding:
                                EdgeInsets.only(left: widget.width * 0.01),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          calendarPicker = !calendarPicker;
                          locationSearchingList = false;
                          roomsCounter = false;
                        });
                      },
                      child: Container(
                        height: widget.height * 0.5,
                        width: widget.width * 0.18,
                        padding: EdgeInsets.only(left: widget.width * 0.01),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child:
                              Text('Choose Your Date', style: smallTextStyle),
                        ),
                      ),
                    ),
                    // VerticalDivider(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          roomsCounter = !roomsCounter;
                          locationSearchingList = false;
                          calendarPicker = false;
                        });
                      },
                      child: Container(
                        height: widget.height * 0.5,
                        width: widget.width * 0.2,
                        padding: EdgeInsets.only(left: widget.width * 0.01),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Rooms',
                            style: smallTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedbox(0.0, widget.width * 0.01),
              Container(
                height: widget.height * 0.065,
                width: widget.width * 0.08,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 93, 239, 255),
                      Color.fromARGB(255, 51, 192, 252),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Search',
                    style: smallTextStyle,
                  ),
                ),
              ),
            ],
          ),
          sizedbox(widget.height * 0.005, 0.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sizedbox(0.0, widget.width * 0.004),
              locationSearchingList
                  ? Container(
                      height: widget.height * 0.5,
                      width: widget.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: Consumer<FeaturesProvider>(
                        builder: (context, locationProvider, child) =>
                            ListView.builder(
                          itemCount: 2,
                          padding: EdgeInsets.symmetric(
                            horizontal: widget.width * 0.00,
                            vertical: widget.height * 0.005,
                          ),
                          itemBuilder: (context, index) {
                            // final location = locationProvider.searchResults[index];
                            return TextButton(
                              style: TextButton.styleFrom(
                                overlayColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              onPressed: () {
                                // location.setLocationText(location['display_name']);
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                // title: Text(location['display_name']),
                                title: Text('data'),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : SizedBox(width: widget.width * 0.305),
              calendarPicker
                  ? Container(
                      height: widget.height * 0.5,
                      width: widget.width * 0.28,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                    )
                  : SizedBox(width: widget.width * 0.19),
              roomsCounter
                  ? Container(
                      height: widget.height * 0.5,
                      width: widget.width * 0.2,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
