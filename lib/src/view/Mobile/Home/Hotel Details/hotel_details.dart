import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/dashboard_provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view%20model/hotel_details_provider.dart';
import 'package:tuch/src/view%20model/room_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Desktop/detaile_page/detaile_page.dart';

import 'package:tuch/src/view%20model/hotel_details_provider.dart';
import 'package:tuch/src/view%20model/room_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/footer.dart';
import 'package:tuch/src/view/Desktop/details/detail_page.dart';
import 'package:tuch/src/view/Mobile/Home/Booking/booking.dart';
import 'package:tuch/src/view/constants/calender_screen.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class HotelDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of some similiar hotels for temporary
    final List<HotelDetails> hoteldetail = [
      HotelDetails(
        name: 'Burj Al Arab Jumeirah',
        category: 'Resorts',
        rating: 5,
        imageUrl: 'assets/images/luxury hotel.jpg',
        originalPrice: 1528,
        currentPrice: 1375,
      ),
      HotelDetails(
        name: 'Jumeirah Al Naseem',
        category: 'Resorts',
        rating: 5,
        imageUrl: 'assets/images/luxury hotel.jpg',
        currentPrice: 610,
      ),
      HotelDetails(
        name: 'Jumeirah Dar Al Masyaf',
        category: 'Resorts',
        rating: 5,
        imageUrl: 'assets/images/luxury hotel.jpg',
        currentPrice: 514,
      ),
      HotelDetails(
        name: 'Grand Cosmopolitan Hotel',
        category: 'Hotels',
        rating: 5,
        imageUrl: 'assets/images/luxury hotel.jpg',
        originalPrice: 185,
        currentPrice: 137,
      ),
    ];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final dashboardProvider =
        Provider.of<DashBoardProvider>(context, listen: false);

    final hotelDetail = Provider.of<HotelDetailProvider>(context).hotelDetail;
    final roomProvider = Provider.of<RoomProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AppBar
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
      //>.............................................................................................................................
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.03, right: width * 0.04, top: height * 0.04),
              //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Hotel,location,reviews  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => ratingStarIcon(height),
                        ),
                      ),
                      Text(
                        'Burj Al Arab Jumeirah',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Dubai, United Arab Emirates",
                            style: GoogleFonts.montserrat(fontSize: 11),
                          ),
                          sizedbox(height * 0.01, width * 0.01),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Show on map",
                              style: GoogleFonts.montserrat(
                                  color: Color.fromARGB(255, 67, 1, 79),
                                  fontSize: 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$476",
                        style: GoogleFonts.montserrat(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      sizedbox(height * 0.01, width * 0.01),
                    ],
                  )
                ],
              ),
            ),
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.03, right: width * 0.05, top: height * 0.04),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>review s and image>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    Row(
                      children: [
                        Container(
                          height: height * 0.04,
                          width: width * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(05),
                            color: Colors.yellow,
                          ),
                          child: Center(
                            child: Text(
                              "8.9",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                          ),
                        ),
                        sizedbox(height * 0.01, width * 0.02),
                        Text(
                          "Excellent",
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "View all",
                            style: GoogleFonts.montserrat(
                                color: Color.fromARGB(255, 67, 1, 79),
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    //.................................... hotel images ..................................................................
                    sizedbox(height * 0.02, width),
                    Container(
                      height: height * 0.45,
                      width: width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(hotelDetail.imageUrl),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    sizedbox(height * 0.01, 0.0),
                    SizedBox(
                      height: height * 0.1,
                      width: width * 0.900,
                      child: ListView.builder(
                        itemCount: 15,
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          width: width * 0.2,
                          margin: EdgeInsets.only(right: width * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(05),
                            color: Colors.grey.shade100,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/thailand.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            //.......................................................... HOUSING INFORMATION......................................................
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.03,
                left: width * 0.02,
                right: width * 0.02,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeLight),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.02,
                      left: width * 0.02,
                      right: width * 0.01,
                      bottom: height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Housing information',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      sizedbox(height * 0.02, width),
                      Text(
                        hotelDetail.description,
                        style: GoogleFonts.montserrat(fontSize: 11),
                      ),
                      sizedbox(height * 0.01, width),
                      GestureDetector(
                          onTap: () {
                            dashboardProvider.scrollToDownr(900);
                          },
                          child: Text(
                            'More about housing',
                            style: GoogleFonts.montserrat(
                                color: Color.fromARGB(255, 67, 1, 79),
                                fontSize: 11),
                          )),
                    ],
                  ),
                ),
              ),
            ),

            //.......................................................................................................................................................................
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Popular Services and amenities>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.02, left: width * 0.02, right: width * 0.02),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeLight
                        // color: darktheme
                        //     ? Color.fromARGB(255, 165, 223, 254)
                        //     : Color.fromARGB(255, 248, 248, 248),
                        ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.02,
                      left: width * 0.02,
                      right: width * 0.01,
                      bottom: height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Popular services and amenities',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      sizedbox(height * 0.02, width),
                      _buildAmenityItem(
                          Icons.wifi, 'Free Wi-Fi', height, width),
                      _buildAmenityItem(
                          Icons.ac_unit, 'Air Conditioning', height, width),
                      sizedbox(height * 0.01, width),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View all',
                            style: GoogleFonts.montserrat(
                                color: Color.fromARGB(255, 67, 1, 79),
                                fontSize: 11),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            //.......................................................................................................................................................................
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>What's Nearby>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.02,
                left: width * 0.02,
                right: width * 0.02,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeLight
                        // color: darktheme
                        //     ? Color.fromARGB(255, 165, 223, 254)
                        //     : Color.fromARGB(255, 248, 248, 248),
                        ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.02,
                      left: width * 0.02,
                      right: width * 0.02,
                      bottom: height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('What\'s nearby',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      sizedbox(height * 0.02, width),
                      _buildNearbyItem(
                          'Souk Madinat Jumeirah', '110 m', height, width),
                      _buildNearbyItem(
                          'Souk Madinat Jumeirah', '210 m', height, width),
                      sizedbox(height * 0.01, width),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View all',
                            style: TextStyle(
                                color: Color.fromARGB(255, 67, 1, 79),
                                fontSize: 12),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            //....................................................................................................................................................................
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.02, left: width * 0.02, right: width * 0.02),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeLight
                        // color: darktheme
                        //     ? Color.fromARGB(255, 165, 223, 254)
                        //     : Color.fromARGB(255, 248, 248, 248),
                        ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.02,
                      left: width * 0.02,
                      right: width * 0.02,
                      bottom: height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'June 21 -22,2 guests,1 room ',
                        // '${featuresProvider.checkingDate} - ${featuresProvider.checkoutDate}  ${featuresProvider.selectedDates.length - 1} Night',
                        style: TextStyle(fontSize: 12, color: greyShadeMedium),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookingCalendarPage()));
                        },
                        child: Text(
                          'Change',
                          style: TextStyle(
                              color: Color.fromARGB(255, 67, 1, 79),
                              fontSize: 12),
                        ),
                      ),
                      DropdownButton<String>(
                        value: 'Late check-out',
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 12,
                        ),
                        style: TextStyle(fontSize: 12),
                        onChanged: (String? newValue) {},
                        items: <String>['Late check-out', 'Early check-in']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 12),
                            ),
                          );
                        }).toList(),
                        underline: Container(), // This removes the underline
                      ),
                      sizedbox(height * 0.02, width),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     _buildFilterButton('All', isSelected: true),
                      //     // _buildFilterButton('Any payment option'),
                      //     _buildFilterButton('Any board type'),
                      //     _buildFilterButton('Any bed type'),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Similiar rooms >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            ListView.builder(
              shrinkWrap: true,
              itemCount: roomProvider.rooms.length,
              itemBuilder: (context, index) {
                final room = roomProvider.rooms[index];
                return RoomWidget(room: room);
              },
            ),
            //......................................................................................................................................................
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Guest reviews>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.02,
                  top: height * 0.03,
                  bottom: height * 0.02),
              child: Text('Guest reviews',
                  style: GoogleFonts.montserrat(
                      fontSize: 19, fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: Container(
                width: width * 0.960,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Consumer<ReviewProvider>(
                      builder: (context, reviewProvider, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: reviewProvider.reviews.length,
                          itemBuilder: (context, index) {
                            return ReviewWidget(
                                review: reviewProvider.reviews[index]);
                          },
                        );
                      },
                    ),
                    sizedbox(height * 0.02, width),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '${172} More Reviews',
                          style: GoogleFonts.montserrat(
                            color: Colors.deepPurple,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    sizedbox(height * 0.02, width),
                  ],
                ),
              ),
            ),
            //>.............................................................................................................................................................
            //............................................... services and a,menities .......................... sery lists of amenities like category wise ........................
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.03,
                left: width * 0.02,
                right: width * 0.02,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeLight),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.02,
                      left: width * 0.03,
                      right: width * 0.01,
                      bottom: height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.03, top: height * 0.01),
                        child: Text('Services and amenities',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                      sizedbox(height * 0.01, width),
                      ...hotelDetail.services.map((amenity) => ListTile(
                            minTileHeight: height / 99,
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 12,
                            ),
                            title: Text(
                              amenity,
                              style: GoogleFonts.montserrat(fontSize: 11),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.03, top: height * 0.01),
                        child: Text(
                          'General',
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      sizedbox(height * 0.01, width),
                      ...hotelDetail.General.map((amenity) => ListTile(
                            minTileHeight: height / 65,
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 13,
                            ),
                            title: Text(
                              amenity,
                              style: GoogleFonts.montserrat(fontSize: 11),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.03, top: height * 0.01),
                        child: Text(
                          'Activities and Recreation',
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      sizedbox(height * 0.01, width),
                      ...hotelDetail.activities.map((amenity) => ListTile(
                            minTileHeight: height / 65,
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 13,
                            ),
                            title: Text(
                              amenity,
                              style: GoogleFonts.montserrat(fontSize: 11),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.03, top: height * 0.01),
                        child: Text(
                          'Food and Drinks',
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      sizedbox(height * 0.01, width),
                      ...hotelDetail.foodanddrinks.map((amenity) => ListTile(
                            minTileHeight: height / 50,
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 13,
                            ),
                            title: Text(
                              amenity,
                              style: GoogleFonts.montserrat(fontSize: 11),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            //.............................................................................................................................................................
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.03, right: width * 0.02, top: height * 0.01),
              child: Text(
                'Information about amenities, level of service, description and room pictures are provided by Jumeirah Al Qasr hotel.',
                style: GoogleFonts.montserrat(
                    fontSize: 10, color: greyShadeMedium),
              ),
            ),
            //.............................................................................................................................................................

            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.03, right: width * 0.02, top: height * 0.01),
              child: Text(
                'We always do our best to verify this information, however, we accept no responsibility for the provision of incorrect or incomplete information by the hotel.',
                style: GoogleFonts.montserrat(
                    fontSize: 10, color: greyShadeMedium),
              ),
            ),
            //.............................................................................................................................................................

            sizedbox(height * 0.04, width),
            //....................................more about hotel details ..........................................................

            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.02, right: width * 0.02, top: height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => ratingStarIcon(height),
                    ),
                  ),
                  Text('Jumeirah al Qasr',
                      style: GoogleFonts.montserrat(
                          fontSize: 19, fontWeight: FontWeight.w600)),
                  sizedbox(height * 0.02, width),
                  Container(
                    height: height * 0.20,
                    width: width,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(-0.3, 1),
                            blurRadius: 2,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 0,
                            color: greyShadeLight
                            // color: darktheme
                            //     ? Color.fromARGB(255, 165, 223, 254)
                            //     : Color.fromARGB(255, 248, 248, 248),
                            ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.02,
                          left: width * 0.02,
                          right: width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Year built',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12, color: greyShadeMedium),
                                  ),
                                  Text(
                                    '2004',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              sizedbox(height * 0.01, width * 0.02),
                              Column(
                                children: [
                                  Text(
                                    'Floors',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12, color: greyShadeMedium),
                                  ),
                                  Text(
                                    ' 7',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              sizedbox(height * 0.01, width * 0.02),
                              Column(
                                children: [
                                  Text(
                                    'Rooms',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12, color: greyShadeMedium),
                                  ),
                                  Text(
                                    '294',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            ],
                          ),
                          sizedbox(height * 0.02, width),
                          Text(
                            'Resort Jumeirah Al Qasr is located in Dubai, United Arab Emirates at Dubai, Jumeirah Beach Road, Madinat Jumeirah Resort 18.5 km from the city center. Check in from 15:00 until 00:00, check out from 07:00 until 12:00. ',
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //.............................................................................................................................................................
                  //...............................................................and policies of hotel ..............................................
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Property Policies',
                            style: GoogleFonts.montserrat(
                                fontSize: 19, fontWeight: FontWeight.w600)),
                        PropertyPolicies(),
                      ],
                    ),
                  ),
                  //.............................................................................................................................................................
                  //.................................................................Location ...............................................................................
                  sizedbox(height * 0.03, width),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(-0.3, 1),
                            blurRadius: 2,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 0,
                            color: greyShadeLight
                            // color: darktheme
                            //     ? Color.fromARGB(255, 165, 223, 254)
                            //     : Color.fromARGB(255, 248, 248, 248),
                            ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.02,
                          left: width * 0.02,
                          right: width * 0.02,
                          bottom: height * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location',
                              style: GoogleFonts.montserrat(
                                  fontSize: 19, fontWeight: FontWeight.w600)),
                          Row(
                            children: [
                              Text(
                                'Corniche Al hamra,Saudia arabia,jeddha',
                                style: GoogleFonts.montserrat(fontSize: 11),
                              ),
                              Text(
                                ' 4.08 km from the center',
                                style: GoogleFonts.montserrat(
                                    fontSize: 11, color: greyShadeMedium),
                              )
                            ],
                          ),
                          sizedbox(height * 0.02, width),
                          Image(
                            image: AssetImage('assets/images/map.png'),
                          ),
                          sizedbox(height * 0.02, width),
                          Text("What's nearby",
                              style: GoogleFonts.montserrat(
                                  fontSize: 19, fontWeight: FontWeight.w600)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sizedbox(height * 0.02, width * 0.03),
                              Row(
                                children: [
                                  Icon(
                                    Icons.other_houses_outlined,
                                    size: 14,
                                    color: greyShadeDark,
                                  ),
                                  sizedbox(height * 0.02, width * 0.03),
                                  Text(
                                    'Attractions',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.06, top: height * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "King Fahadh's Fountain  1.2 km",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 11,
                                      ),
                                    ),
                                    sizedbox(height * 0.01, width),
                                    Text("King Fahadh's Fountain  1.2 km",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 11,
                                        )),
                                  ],
                                ),
                              ),
                              sizedbox(height * 0.03, width),
                              Text(
                                'All distances are measured in straight lines.Actual distances\nmay vary',
                                style: GoogleFonts.montserrat(
                                    fontSize: 11, color: greyShadeMedium),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  sizedbox(height * 0.06, width),
                  Text('Similar hotels',
                      style: GoogleFonts.montserrat(
                          fontSize: 19, fontWeight: FontWeight.w600)),
                  Text(
                    'Popular with our customers',
                    style: GoogleFonts.montserrat(fontSize: 12),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: hoteldetail.length,
                    itemBuilder: (context, index) {
                      return HotelCards(
                        hotel: hoteldetail[index],
                      );
                    },
                  ),
                  sizedbox(height * 0.02, width),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle view all offers action
                      },
                      child: Text(
                        'View all offers',
                        style: GoogleFonts.montserrat(
                            color: Color.fromARGB(255, 67, 1, 79)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            sizedbox(height * 0.20, width),
            Footer(),
          ],
        ),
      ),
    );
  }

  Container reviewsList(double width, double height) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: Column(
        children: [
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.02,
                ),
                margin: EdgeInsets.only(top: height * 0.01),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: height * 0.03,
                                backgroundColor: Colors.grey.shade200,
                                child: Center(
                                  child: Text('A', style: mediumtextstyle),
                                ),
                              ),
                              sizedbox(0.0, width * 0.01),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Aloika',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'March 2024',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          sizedbox(height * 0.01, 0.0),
                        ],
                      ),
                    ),
                    sizedbox(0.0, width * 0.08),
                    SizedBox(
                      width: width * 0.47,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.006,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber[400],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child:
                                      Text('4.6', style: mediumtextstylelight),
                                ),
                              ),
                              sizedbox(0.0, width * 0.01),
                              Text(
                                'Exeptional',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          sizedbox(height * 0.01, 0.0),
                          Text(
                            "Lovely hotel staff were excellent and very friendly. Good selection of food and beverage outlets. Comfortable rooms'"
                            "with all amenities. 'Overall a very pleasant stay. Great place for a winter break, beach and pools were lovely. ",
                            style: smallTextStyle,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          sizedbox(height * 0.02, width),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                '${172} More Reviews',
                style: GoogleFonts.montserrat(
                  color: Colors.deepPurple,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          sizedbox(height * 0.02, width),
        ],
      ),
    );
  }

//***********************************************************************************FINAL************************************************************************************** */
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Rating star
  Widget ratingStarIcon(height) {
    return Icon(
      Icons.star,
      color: orangeColor,
      size: height * 0.02,
    );
  }

  Widget _buildAmenityItem(IconData icon, String title, height, width) {
    return Row(
      children: [
        Icon(
          icon,
          size: 12,
        ),
        sizedbox(height * 0.01, width * 0.02),
        Text(
          title,
          style: GoogleFonts.montserrat(fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildNearbyItem(String place, String distance, height, width) {
    return Row(
      children: [
        Icon(
          Icons.place,
          size: 12,
        ),
        sizedbox(height * 0.01, width * 0.02),
        Text(
          place,
          style: GoogleFonts.montserrat(fontSize: 11),
        ),
        Spacer(),
        Text(
          distance,
          style: GoogleFonts.montserrat(fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildFilterButton(String label, {bool isSelected = false}) {
    return ChoiceChip(
      backgroundColor: greyShadeDark,
      selectedColor: Colors.black,
      label: Text(
        label,
        style: GoogleFonts.montserrat(fontSize: 12, color: backgroundColor),
      ),
      selected: isSelected,
      onSelected: (bool selected) {},
    );
  }
}

//******************************************************************* THE END ************************************************************************************************ */
class PropertyPolicies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        PolicySection(
          icon: Icons.access_time,
          title: 'Check-in & Check-out',
          content:
              'Check-in from 15:00 until 23:00. Check-out from 07:00 until 15:00.',
        ),
        PolicySection(
          icon: Icons.room_service,
          title: 'Front Desk',
          content: '24 Hour Front Desk.',
        ),
        PolicySection(
          icon: Icons.child_care,
          title: 'Children and extra beds',
          content: 'Children are welcome (all ages).\n\n'
              'Children of 13 y.o. and above are considered adults at this property.\n\n'
              'Crib and extra bed policies:\n'
              '0 years old or over — extra bed upon request SAR 150 per night.\n'
              '0 - 2 years old — crib upon request for free.\n\n'
              'The number of cribs allowed depends on the room type you choose. '
              'Please check the maximum capacity of the room you have selected. '
              'All cribs and extra beds are subject to availability.',
        ),
        PolicySection(
          icon: Icons.pets,
          title: 'Pets',
          content: 'Pets not allowed.',
        ),
        PolicySection(
          icon: Icons.payment,
          title: 'Payment method',
          content: 'Cards accepted: American Express, Visa, Mastercard. '
              'Cash payments are not available.',
          paymentIcons: [
            "assets/images/gpay.png",
            "assets/images/visa.jpg",
            "assets/images/Google_Pay_GPay_Logo-512.webp"
          ],
        ),
      ],
    );
  }
}

class PolicySection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final List<String>? paymentIcons;

  PolicySection({
    required this.icon,
    required this.title,
    required this.content,
    this.paymentIcons,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: greyShadeLight,
                size: 14,
              ),
              sizedbox(height * 0.01, width * 0.03),
              Text(
                title,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05, top: height * 0.01),
            child: Text(
              content,
              style: GoogleFonts.montserrat(fontSize: 11),
            ),
          ),
          if (paymentIcons != null)
            Padding(
              padding: EdgeInsets.only(
                  right: width * 0.07, left: width * 0.04, top: height * 0.02),
              child: Row(
                children: paymentIcons!
                    .map((Image) => Padding(
                          padding: EdgeInsets.only(right: 2.0),
                          child: Container(
                            height: height * 0.05,
                            width: width * 0.08,
                            decoration: BoxDecoration(
                                image:
                                    DecorationImage(image: AssetImage(Image)),
                                border: Border.all(
                                  color: greyShadeLight,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class RoomWidget extends StatelessWidget {
  final Room room;

  RoomWidget({required this.room});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.02, top: height * 0.03),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: height * 0.15,
                  width: width * 0.25,
                  padding: EdgeInsets.all(height * 0.01),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/Dubai.png'),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: const Color.fromARGB(45, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      icon:
                          const Icon(Icons.fullscreen, color: backgroundColor),
                    ),
                  ),
                ),
              ),
              sizedbox(height * 0.01, width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(room.title,
                      style: GoogleFonts.montserrat(
                          fontSize: 19, fontWeight: FontWeight.w600)),
                  Text(
                    '4 Rooms Photos',
                    style: GoogleFonts.montserrat(
                        color: Color.fromARGB(255, 67, 1, 79), fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [
              ...room.options
                  .map((option) => RoomOptionWidget(option: option))
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}

class RoomOptionWidget extends StatelessWidget {
  final RoomOption option;

  RoomOptionWidget({required this.option});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: width * 0.04, top: height * 0.03),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BookingScreen()));
        },
        child: Container(
          width: width * 0.950,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(-0.3, 1),
                  blurRadius: 2,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 0,
                  color: greyShadeLight
                  // color: darktheme
                  //     ? Color.fromARGB(255, 165, 223, 254)
                  //     : Color.fromARGB(255, 248, 248, 248),
                  ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: height * 0.02,
                left: width * 0.02,
                right: width * 0.02,
                bottom: height * 0.02),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.bed_rounded,
                      size: 12,
                      color: greyShadeDark,
                    ),
                    Text(
                      'Queen bed',
                      style: GoogleFonts.montserrat(fontSize: 11),
                    )
                  ],
                ),
                sizedbox(height * 0.01, width),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.red,
                      size: 12,
                    ),
                    Text(
                      option.breakfastIncluded
                          ? "Breakfast included"
                          : "Room only",
                      style: GoogleFonts.montserrat(fontSize: 11),
                    )
                  ],
                ),
                sizedbox(height * 0.01, width),
                Row(
                  children: [
                    Icon(
                      Icons.not_interested_sharp,
                      size: 12,
                      color: greyShadeDark,
                    ),
                    Text(
                      'No free cancellation',
                      style: GoogleFonts.montserrat(fontSize: 11),
                    )
                  ],
                ),
                sizedbox(height * 0.01, width),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.green,
                    ),
                    Text(
                      'Pay Now',
                      style: GoogleFonts.montserrat(fontSize: 11),
                    ),
                    Text(
                      '(Use bonus promo codes) ',
                      style: GoogleFonts.montserrat(
                          color: Colors.green, fontSize: 11),
                    )
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'For 1 night,\ntaxes included',
                          style: GoogleFonts.montserrat(
                              fontSize: 11, color: greyShadeMedium),
                        ),
                        sizedbox(height * 0.01, width * 0.01),
                        Text(
                          "Cashback in bonus point: \$${option.cashback.toStringAsFixed(2)}",
                          style: GoogleFonts.montserrat(
                              color: Colors.green, fontSize: 11),
                        ),
                        sizedbox(height * 0.02, width * 0.01),
                        Text(
                          'More details',
                          style: GoogleFonts.montserrat(
                              color: Color.fromARGB(255, 67, 1, 79),
                              fontSize: 11),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$${option.price.toStringAsFixed(2)}",
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        sizedbox(height * 0.01, width * 0.01),
                        // GradiantButton(
                        //   height: height * 0.045,
                        //   width: width * 0.12,
                        //   text: 'Select',
                        //   onpressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => BookingScreen(),
                        //       ),
                        //     );
                        //   },
                        // )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// review_widget.dart

class ReviewWidget extends StatelessWidget {
  final Review review;

  ReviewWidget({required this.review});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: height * 0.03,
            left: width * 0.02,
            right: width * 0.02,
            bottom: height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: height * 0.04,
                  width: width * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(05),
                    color: Colors.yellow,
                  ),
                  child: Center(
                    child: Text(
                      review.rating.toString(),
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ),
                ),
                sizedbox(height * 0.01, width * 0.02),
                Text(
                  review.title,
                  style: GoogleFonts.montserrat(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            sizedbox(height * 0.02, width),
            Text(
              review.body,
              style: GoogleFonts.montserrat(fontSize: 11),
            ),
            sizedbox(height * 0.02, width),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: greyShadeLight),
                  borderRadius: BorderRadius.circular(08)),
              child: Padding(
                padding: EdgeInsets.only(
                    top: height * 0.02,
                    left: width * 0.02,
                    right: width * 0.02,
                    bottom: height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: greyShadeLight,
                          child: Text(
                            review.userName[0],
                            style: GoogleFonts.montserrat(
                                fontSize: 12, color: backgroundColor),
                          ),
                        ),
                        sizedbox(height * 0.01, width * 0.02),
                        Text(
                          review.userName,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    sizedbox(height * 0.02, width),
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.person_2_outlined,
                    //       size: 12,
                    //     ),
                    //     // Text(
                    //     //   review.userType,
                    //     //   style: TextStyle(
                    //     //     fontSize: 12,
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 10,
                          color: greyShadeMedium,
                        ),
                        Text(
                          review.date,
                          style: GoogleFonts.montserrat(
                              fontSize: 10, color: greyShadeMedium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelDetails {
  final String name;
  final String category;
  final int rating;
  final String imageUrl;
  final double? originalPrice;
  final double currentPrice;

  HotelDetails({
    required this.name,
    required this.category,
    required this.rating,
    required this.imageUrl,
    this.originalPrice,
    required this.currentPrice,
  });
}

class HotelCards extends StatelessWidget {
  final HotelDetails hotel;

  HotelCards({required this.hotel});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        // left: width * 0.01,
        // right: width * 0.01,
        top: height * 0.02,
      ),
      child: Container(
        width: width * 0.860,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(-0.3, 1),
                  blurRadius: 2,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 0,
                  color: greyShadeLight
                  // color: darktheme
                  //     ? Color.fromARGB(255, 165, 223, 254)
                  //     : Color.fromARGB(255, 248, 248, 248),
                  ),
            ],
            color: backgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                    image: AssetImage(
                      hotel.imageUrl,
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.01,
                  left: width * 0.02,
                  right: width * 0.02,
                  bottom: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              hotel.rating,
                              (index) => Icon(Icons.star,
                                  color: Colors.orange, size: 12),
                            ),
                          ),
                          Text(
                            hotel.category,
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        hotel.name,
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (hotel.originalPrice != null)
                        Text(
                          '\$${hotel.originalPrice}',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red,
                          ),
                        ),
                      SizedBox(width: 8.0),
                      Text(
                        '\$${hotel.currentPrice}',
                        style: GoogleFonts.montserrat(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        'For 1 night',
                        style: GoogleFonts.montserrat(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//................................................................................................................................................................