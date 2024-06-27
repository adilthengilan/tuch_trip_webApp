import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/hotel_details_provider.dart';
import 'package:tuch/src/view%20model/room_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Mobile/Home/Booking/payment_screen.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/Mobile/profile/profile_screen.dart';
import 'package:tuch/src/view/constants/calender_screen.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class HotelDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final hotelDetail = Provider.of<HotelDetailProvider>(context).hotelDetail;
    final roomProvider = Provider.of<RoomProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AppBar
      drawer: DrawerScreen(),
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: blackShadeColor,
              ));
        }),
        title: Center(child: Text('Tuch Trip', style: headingblack)),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: blackShadeColor),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
          ),
        ],
      ),
      //>.............................................................................................................................
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedbox(height * 0.03, width),
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, right: width * 0.04),
              //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Hotel,location,reviews>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
                      Text('Jumeira minah A`salam - Madinathu Jumeira'),
                      Row(
                        children: [
                          Text(
                            "Dubai, United Arab Emirates",
                            style: TextStyle(color: Colors.grey),
                          ),
                          sizedbox(height * 0.01, width * 0.01),
                          Text(
                            "Show on map",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.favorite_border_outlined,
                    size: 17,
                    color: greyShadeDark,
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
                          height: height * 0.03,
                          width: width * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(07),
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
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          "View all",
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ],
                    ),
                    sizedbox(height * 0.02, width),
                    Container(
                      height: height * 0.45,
                      width: width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(hotelDetail.imageUrl),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ]),
            ),
            //.......................................................... HOUSING INFORMATION......................................................
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.03, left: width * 0.02, right: width * 0.02),
              child: Container(
                height: height * 0.20,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeDark),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.02,
                      left: width * 0.02,
                      right: width * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Housing information',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      sizedbox(height * 0.01, width),
                      Text(
                        hotelDetail.description,
                        style: TextStyle(fontSize: 12),
                      ),
                      sizedbox(height * 0.01, width),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'More about housing',
                            style: TextStyle(color: Colors.blue, fontSize: 12),
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
                height: height * 0.18,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeDark
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
                      right: width * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Popular services and amenities',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      sizedbox(height * 0.01, width),
                      _buildAmenityItem(
                          Icons.wifi, 'Free Wi-Fi', height, width),
                      _buildAmenityItem(
                          Icons.ac_unit, 'Air Conditioning', height, width),
                      sizedbox(height * 0.01, width),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View all',
                            style: TextStyle(color: Colors.blue, fontSize: 12),
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
                  top: height * 0.02, left: width * 0.02, right: width * 0.02),
              child: Container(
                height: height * 0.18,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeDark
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
                      Text('What\'s nearby',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      sizedbox(height * 0.01, width),
                      _buildNearbyItem(
                          'Souk Madinat Jumeirah', '110 m', height, width),
                      _buildNearbyItem(
                          'Souk Madinat Jumeirah', '210 m', height, width),
                      sizedbox(height * 0.01, width),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View all',
                            style: TextStyle(color: Colors.blue, fontSize: 12),
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
                height: height * 0.20,
                width: width,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeDark
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
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ),
                      Text(
                        'Late check- out',
                        style: TextStyle(fontSize: 12),
                      ),
                      // DropdownButton<String>(
                      //   value: 'Late check-out',
                      //   onChanged: (String? newValue) {},
                      //   items: <String>['Late check-out', 'Early check-in']
                      //       .map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                      sizedbox(height * 0.02, width),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildFilterButton('All', isSelected: true),
                          // _buildFilterButton('Any payment option'),
                          _buildFilterButton('Any board type'),
                          _buildFilterButton('Any bed type'),
                        ],
                      )
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
              padding: EdgeInsets.only(left: width * 0.04, top: height * 0.02),
              child: Text(
                'Guest reviews',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Consumer<ReviewProvider>(
              builder: (context, reviewProvider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: reviewProvider.reviews.length,
                  itemBuilder: (context, index) {
                    return ReviewWidget(review: reviewProvider.reviews[index]);
                  },
                );
              },
            ),
            //>.............................................................................................................................................................
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.03,
                left: width * 0.02,
                right: width * 0.02,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeDark),
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
                      Text('Services and amenities',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      sizedbox(height * 0.01, width),
                      ...hotelDetail.services.map((amenity) => ListTile(
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 12,
                            ),
                            title: Text(
                              amenity,
                              style: TextStyle(fontSize: 12),
                            ),
                          )),
                      sizedbox(height * 0.01, width),
                      Text(
                        'General',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      ...hotelDetail.General.map((amenity) => ListTile(
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 13,
                            ),
                            title: Text(
                              amenity,
                              style: TextStyle(fontSize: 12),
                            ),
                          )),
                      Text(
                        'Activities and Recreation',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      ...hotelDetail.activities.map((amenity) => ListTile(
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 13,
                            ),
                            title: Text(
                              amenity,
                              style: TextStyle(fontSize: 12),
                            ),
                          )),
                      Text(
                        'Food and Drinks',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      ...hotelDetail.foodanddrinks.map((amenity) => ListTile(
                            leading: Icon(
                              Icons.check_circle_outline,
                              size: 13,
                            ),
                            title: Text(
                              amenity,
                              style: TextStyle(fontSize: 12),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.02, right: width * 0.02, top: height * 0.01),
              child: Text(
                'Information about amenities, level of service, description and room pictures are provided by Jumeirah Al Qasr hotel.',
                style: TextStyle(fontSize: 10, color: greyShadeMedium),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.02, right: width * 0.02, top: height * 0.01),
              child: Text(
                'We always do our best to verify this information, however, we accept no responsibility for the provision of incorrect or incomplete information by the hotel.',
                style: TextStyle(fontSize: 10, color: greyShadeMedium),
              ),
            ),
            sizedbox(height * 0.02, width),

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
                  Text(
                    'Jumeirah al Qasr',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  sizedbox(height * 0.02, width),
                  Container(
                    height: height * 0.20,
                    width: width,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(-0.3, 1),
                            blurRadius: 2,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 0,
                            color: greyShadeDark
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
                                    style: TextStyle(
                                        fontSize: 12, color: greyShadeMedium),
                                  ),
                                  Text(
                                    '2004',
                                    style: TextStyle(
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
                                    style: TextStyle(
                                        fontSize: 12, color: greyShadeMedium),
                                  ),
                                  Text(
                                    ' 7',
                                    style: TextStyle(
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
                                    style: TextStyle(
                                        fontSize: 12, color: greyShadeMedium),
                                  ),
                                  Text(
                                    '294',
                                    style: TextStyle(
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
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text('Property Policies')
                ],
              ),
            ),

            sizedbox(height * 0.06, width),
            Footer(),
          ],
        ),
      ),
    );
  }

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
          style: TextStyle(fontSize: 12),
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
          style: TextStyle(fontSize: 12),
        ),
        Spacer(),
        Text(
          distance,
          style: TextStyle(fontSize: 12),
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
        style: TextStyle(fontSize: 12, color: backgroundColor),
      ),
      selected: isSelected,
      onSelected: (bool selected) {},
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
      padding: EdgeInsets.only(left: width * 0.03, top: height * 0.03),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => BookingScreen()));
                },
                child: Container(
                  height: height * 0.15,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(room.image), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              sizedbox(height * 0.01, width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(room.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(
                    '4 Rooms Photos',
                    style: TextStyle(color: Colors.blue),
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
          height: height * 0.30,
          width: width * 0.950,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: Offset(-0.3, 1),
                  blurRadius: 2,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 0,
                  color: greyShadeDark
                  // color: darktheme
                  //     ? Color.fromARGB(255, 165, 223, 254)
                  //     : Color.fromARGB(255, 248, 248, 248),
                  ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: height * 0.02, left: width * 0.02, right: width * 0.02),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.bed,
                      size: 12,
                      color: greyShadeDark,
                    ),
                    Text(
                      'Queen bed',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
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
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.not_interested_sharp,
                      size: 12,
                      color: greyShadeDark,
                    ),
                    Text(
                      'No free cancellation',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.green,
                    ),
                    Text(
                      'Pay Now',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '(Use bonus promo codes) ',
                      style: TextStyle(color: Colors.green, fontSize: 12),
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
                          style:
                              TextStyle(fontSize: 12, color: greyShadeMedium),
                        ),
                        Text(
                          "Cashback in bonus point: \$${option.cashback.toStringAsFixed(2)}",
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                        Text(
                          'More details',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$${option.price.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                )

                //   ListTile(
                //     title: Text(option.description),
                //     subtitle: Text(
                //         option.breakfastIncluded ? "Breakfast included" : "Room only"),

                //     trailing: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text("\$${option.price.toStringAsFixed(2)}"),
                //         Text("Cashback: \$${option.cashback.toStringAsFixed(2)}",
                //             style: TextStyle(color: Colors.green)),
                //       ],
                //     ),
                //   ),
                //   Divider(),
                // ],
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

    return Padding(
      padding: EdgeInsets.only(
          right: width * 0.04, top: height * 0.03, left: width * 0.04),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(-0.3, 1),
                blurRadius: 2,
                blurStyle: BlurStyle.normal,
                spreadRadius: 0,
                color: greyShadeDark),
          ],
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
                    height: height * 0.03,
                    width: width * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(07),
                      color: Colors.yellow,
                    ),
                    child: Center(
                      child: Text(
                        review.rating.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                  ),
                  sizedbox(height * 0.01, width * 0.02),
                  Text(
                    review.title,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              sizedbox(height * 0.02, width),
              Text(
                review.body,
                style: TextStyle(fontSize: 12),
              ),
              sizedbox(height * 0.02, width),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: greyShadeMedium),
                    borderRadius: BorderRadius.circular(08)),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.01,
                    left: width * 0.02,
                    right: width * 0.02,
                  ),
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
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          sizedbox(height * 0.01, width * 0.02),
                          Text(
                            review.userName,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person_2_outlined,
                            size: 12,
                          ),
                          Text(
                            review.userType,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            size: 12,
                          ),
                          Text(
                            review.date,
                            style: TextStyle(
                              fontSize: 12,
                            ),
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
      ),
    );
  }
}
