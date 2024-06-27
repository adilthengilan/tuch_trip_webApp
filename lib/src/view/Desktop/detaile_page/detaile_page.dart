import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/dashboard_provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Desktop/booking_page/booking_page.dart';
import 'package:tuch/src/view/Desktop/desktopview.dart';
import 'package:tuch/src/view/Desktop/search_page/search_page.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class DetailePageDesktop extends StatelessWidget {
  final double? rating;
  const DetailePageDesktop({
    super.key,
    this.rating = 4.6,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final dashboardProvider =
        Provider.of<DashBoardProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(height: height, width: width),
      body: SingleChildScrollView(
        controller: dashboardProvider.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.white38,
              margin: EdgeInsets.symmetric(horizontal: width * 0.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<FeaturesProvider>(
                    builder: (context, feature, child) => Text(
                      'Location, ${feature.checkingDate == '' ? DateTime.now().day : feature.checkingDate}, 11 Night Guests ${feature.adults}, Rooms ${feature.rooms}',
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
                        color: Colors.black,
                      ),
                      const Spacer(),
                      Consumer<FeaturesProvider>(
                        builder: (context, calendar, child) => Text(
                          '${calendar.nights} Night from',
                        ),
                      ),
                      sizedbox(0.0, width * 0.01),
                      Text('\$460', style: mediumtextstylelight),
                      sizedbox(0.0, width * 0.01),
                      GradiantButton(
                        height: height * 0.05,
                        width: width * 0.07,
                        text: 'Offers',
                        onpressed: () {
                          dashboardProvider.scrollToDownr(900);
                        },
                      ),
                      sizedbox(0.0, width * 0.012),
                    ],
                  ),
                  Text('Dubai, United Emirites'),
                  sizedbox(height * 0.02, width),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: height * 0.4,
                            width: width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/luxury hotel.jpg'),
                              ),
                            ),
                          ),
                          sizedbox(height * 0.01, 0.0),
                          SizedBox(
                            height: height * 0.1,
                            width: width * 0.5,
                            child: ListView.builder(
                              itemCount: 15,
                              physics: AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                width: width * 0.1,
                                margin: EdgeInsets.only(right: width * 0.01),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/thailand.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedbox(0.0, width * 0.01),
                      hotelDiscriptionAndLocationMap(height, width),
                    ],
                  ),
                  sizedbox(height * 0.02, width),
                  ////////==================================================== Aminities Short List =====================================================
                  aminitiesShortListWithViewAllButton(height, width),
                  sizedbox(height * 0.01, width),
                  ////======================================================== Whats Nearby The Hotel ============================================
                  whatsNearbyTheHotelShortList(width, height),
                  sizedbox(height * 0.04, width),
                  Text('Select Rooms', style: mediumtextstylelight),
                  sizedbox(height * 0.02, width),
                  ////========================================================= Select Your Rooms From The List =======================================
                  roomsDetailesroomsList(height, width),
                  sizedbox(height * 0.04, width),
                  Text('Guest Review', style: mediumtextstylelight),
                  sizedbox(height * 0.02, 0.0),
                  /////========================================================== Guest Reviews List  ====================================================
                  reviewsList(width, height),
                  sizedbox(height * 0.04, width),
                  Text('Service and aminities', style: mediumtextstylelight),
                  sizedbox(height * 0.02, width),
                  //=============================================================== Aminities Long List =====================================================
                  aminitiesListingInContainer(width, height),
                  sizedbox(height * 0.01, width),
                  SizedBox(
                    width: width * 0.75,
                    child: const Text(
                        "Information about amenities, level of service, description and room pictures are provided by"
                        " Jumeirah Al Qasr hotel.We always do our best to verify this information, however, we accept "
                        "no responsibility for the provision of incorrect or incomplete information by the hotel."),
                  ),
                  sizedbox(height * 0.04, 0.0),
                  //////================================================================== Property And Policy ================================================
                  propertyPolicies(width, height),
                  sizedbox(height * 0.04, width),
                  Text('Similar hotels', style: mediumtextstylelight),
                  Text('Popular with our customers', style: smallTextStyle),
                  sizedbox(height * 0.04, width),
                  //////=================================================================== Related Hotels List Indro  ========================================
                  similarHotelsListRow(width, height, context),
                ],
              ),
            ),
            sizedbox(height * 0.2, width),
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

  ListView roomsDetailesroomsList(double height, double width) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: height * 0.02),
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.15,
                    width: width * 0.12,
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
                        icon: const Icon(Icons.fullscreen,
                            color: backgroundColor),
                      ),
                    ),
                  ),
                  sizedbox(0.0, width * 0.015),
                  Text(
                    'Deluxe rooms, 538 — 591.8 m2',
                    style: mediumtextstylelight,
                  ),
                ],
              ),
              sizedbox(height * 0.02, width),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  height: height * 0.2,
                  width: width,
                  margin: EdgeInsets.only(bottom: height * 0.02),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.grey.shade300,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              1,
                              (index) => Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.bed_outlined,
                                    color: Colors.grey.shade700,
                                    size: height * 0.025,
                                  ),
                                  sizedbox(0.0, width * 0.004),
                                  Text(
                                    'King Bed',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Room Only', style: smallTextStyle),
                              sizedbox(height * 0.01, 0.0),
                              Consumer<FeaturesProvider>(
                                builder: (context, calendar, child) => Text(
                                  'Free Cancelation until ${calendar.checkingDate} 18:00',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.green,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              sizedbox(height * 0.01, 0.0),
                              Text('Pay at Property', style: smallTextStyle)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("\$357", style: mediumtextstylelight),
                              Consumer<FeaturesProvider>(
                                builder: (context, feature, child) =>
                                    Text('For ${feature.nights} Night'),
                              ),
                              Text(
                                'Texes Included',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'More Details',
                              style: GoogleFonts.montserrat(
                                color: Colors.deepPurple,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          sizedbox(0.0, width * 0.01),
                          for (int i = 0; i < 3; i++)
                            Container(
                              margin: EdgeInsets.only(
                                left: width * 0.01,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.006,
                                  vertical: height * 0.006),
                              color: Colors.grey.shade300,
                              child: Center(
                                child: Text(
                                  'Free Water Park passes',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          const Spacer(),
                          GradiantButton(
                            height: height * 0.045,
                            width: width * 0.08,
                            text: 'Select',
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BookingPage(),
                                ),
                              );
                            },
                          )
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

  Container aminitiesListingInContainer(double width, double height) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
      ),
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
          sizedbox(height * 0.04, width),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //============================================================ Services ==============================================
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Services',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedbox(height * 0.015, 0.0),
                  for (int i = 0; i < 15; i++)
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: height * 0.02,
                        ),
                        sizedbox(0.0, width * 0.006),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.008,
                          ),
                          child: Text(
                            'VIP Room Service',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
              //============================================================ General ==============================================
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'General',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedbox(height * 0.015, 0.0),
                  for (int i = 0; i < 10; i++)
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: height * 0.02,
                        ),
                        sizedbox(0.0, width * 0.006),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.008,
                          ),
                          child: Text(
                            'VIP Room Service',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
              //============================================================ Transportation ==============================================
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transportation',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedbox(height * 0.015, 0.0),
                  for (int i = 0; i < 8; i++)
                    Row(
                      children: [
                        Icon(Icons.check_circle_outline, size: height * 0.02),
                        sizedbox(0.0, width * 0.006),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.008,
                          ),
                          child: Text(
                            'VIP Room Service',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
              //============================================================ Safety & Security ==============================================
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Safety & security',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedbox(height * 0.015, 0.0),
                  for (int i = 0; i < 4; i++)
                    Row(
                      children: [
                        Icon(Icons.check_circle_outline, size: height * 0.02),
                        sizedbox(0.0, width * 0.006),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.008,
                          ),
                          child: Text(
                            'VIP Room Service',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          sizedbox(height * 0.04, width),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //============================================================ Activities and Recreation ==============================================
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Activities and Recreation',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedbox(height * 0.015, 0.0),
                  for (int i = 0; i < 13; i++)
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: height * 0.02,
                        ),
                        sizedbox(0.0, width * 0.006),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.008,
                          ),
                          child: Text(
                            'VIP Room Service',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
              //============================================================ Services for Childrens ==============================================
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Services for children',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedbox(height * 0.015, 0.0),
                  for (int i = 0; i < 10; i++)
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: height * 0.02,
                        ),
                        sizedbox(0.0, width * 0.006),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.008,
                          ),
                          child: Text(
                            'VIP Room Service',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
              //============================================================ Food and Drink ==============================================
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food & Drink',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedbox(height * 0.015, 0.0),
                  for (int i = 0; i < 8; i++)
                    Row(
                      children: [
                        Icon(Icons.check_circle_outline, size: height * 0.02),
                        sizedbox(0.0, width * 0.006),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.008,
                          ),
                          child: Text(
                            'VIP Room Service',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
              //============================================================ OutDoors ==============================================
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outdoors',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedbox(height * 0.015, 0.0),
                  for (int i = 0; i < 10; i++)
                    Row(
                      children: [
                        Icon(Icons.check_circle_outline, size: height * 0.02),
                        sizedbox(0.0, width * 0.006),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.008,
                          ),
                          child: Text(
                            'VIP Room Service',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          sizedbox(height * 0.04, width),
          //============================================================ Parking ==============================================
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Parking',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedbox(height * 0.015, 0.0),
                  for (int i = 0; i < 13; i++)
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: height * 0.02,
                        ),
                        sizedbox(0.0, width * 0.006),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.008,
                          ),
                          child: Text(
                            'VIP Room Service',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
              sizedbox(0.0, width * 0.1),
              //============================================================ Internet ==============================================
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Internet',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedbox(height * 0.015, 0.0),
                  for (int i = 0; i < 10; i++)
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: height * 0.02,
                        ),
                        sizedbox(0.0, width * 0.006),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.008,
                          ),
                          child: Text(
                            'VIP Room Service',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ],
          ),
          sizedbox(height * 0.04, width)
        ],
      ),
    );
  }

  Container hotelDiscriptionAndLocationMap(double height, double width) {
    return Container(
      height: height * 0.53,
      width: width * 0.18,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 4,
            color: Color.fromARGB(215, 237, 237, 237),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/locationMapimage.png'),
              ),
            ),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(width * 0.1, height * 0.028),
                  side: BorderSide(
                    color: Colors.cyan.shade300,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  //==================================================
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined),
                    sizedbox(0.0, width * 0.002),
                    Text('On Map', style: smallTextStyle),
                  ],
                ),
              ),
            ),
          ),
          sizedbox(height * 0.02, 0.0),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: width * 0.01),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.006,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber[400],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text('4.6', style: mediumtextstylelight),
                ),
              ),
              sizedbox(0.0, width * 0.01),
              Text(
                rating! <= 1
                    ? 'Below Average'
                    : rating! <= 2
                        ? 'Average'
                        : rating! <= 3
                            ? 'Good'
                            : rating! <= 4
                                ? 'Very Good'
                                : rating! > 4
                                    ? 'Excellent'
                                    : '',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          sizedbox(height * 0.02, 0.0),
          Padding(
            padding: EdgeInsets.only(left: width * 0.01),
            child: Text(
              'Housing Overview',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          sizedbox(height * 0.01, 0.0),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.01,
            ),
            child: SizedBox(
              child: Text(
                'Hotel Le Méridien Dubai Hotel & Conference Centre is located in Dubai,'
                'United Arab Emirates at Dubai,'
                'Airport Road 4.5 km from the city center.'
                'Check in after 14:00, check out until 12:00.',
                maxLines: 6,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          sizedbox(height * 0.01, 0.0),
          Padding(
            padding: EdgeInsets.only(left: width * 0.01),
            child: InkWell(
              onTap: () {},
              child: Text(
                'More Info',
                style: GoogleFonts.montserrat(
                    color: Colors.deepPurple,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

//This method Showing Aminities of Hotel A Short List With View all Button when Click view All Button Scroll down to Exact List of Aminities
  Container aminitiesShortListWithViewAllButton(double height, double width) {
    return Container(
      height: height * 0.23,
      width: width,
      color: backgroundColor,
      child: Wrap(
        runSpacing: height * 0.015,
        alignment: WrapAlignment.spaceBetween,
        children: List.generate(
          10,
          (index) => Padding(
            padding: EdgeInsets.only(right: width * 0.01),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.01,
                vertical: height * 0.025,
              ),
              decoration: index != 9
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                    )
                  : null,
              child: index != 9
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.pool_outlined),
                        sizedbox(0.0, width * 0.006),
                        Text('Fabulous breakfast'),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(right: width * 0.02),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: GoogleFonts.montserrat(
                              fontSize: 14, color: Colors.deepPurple),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

// This method is for whats nearby the hotel short List with when click view all button scroll to down exact list of whats near view all button
  Container whatsNearbyTheHotelShortList(double width, double height) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 4,
            color: Color.fromARGB(255, 237, 237, 237),
          ),
          BoxShadow(
            offset: Offset(-1, -1),
            blurRadius: 4,
            color: Color.fromARGB(255, 237, 237, 237),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.02, left: width * 0.015, bottom: height * 0.01),
            child: Text(
              "What's Near",
              style: mediumtextstylelight,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.02,
              horizontal: width * 0.02,
            ),
            child: Wrap(
              runSpacing: height * 0.03,
              spacing: width * 0.1,
              children: List.generate(
                8,
                (index) => index != 7
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.shopping_bag_outlined),
                          sizedbox(0.0, width * 0.006),
                          Text(
                            'Dubai Tennis ',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    : TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: GoogleFonts.montserrat(
                            color: Colors.deepPurple,
                            fontSize: 14,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox propertyPolicies(double width, double height) {
    List<dynamic> icons = [
      Icons.alarm_outlined,
      Icons.circle,
      Icons.child_care_outlined,
      Icons.pets_outlined,
      Icons.payment_outlined
    ];
    List<String> headings = [
      'Check-in & Check-out',
      'Front Desk',
      'Children and extra beds',
      'Pets',
      'Payment method',
    ];
    List<String> policiesTexts = [
      'Check-in from 15:00. Check-out until 12:00.',
      '24 Hour Front Desk.',
      'Children are welcome (all ages).',
      'Pets not allowed.',
      'Cards accepted: American Express, Visa, Mastercard, Diners Club. Cash payments are not available.',
    ];
    List<String> logopath = [
      'assets/images/Google pay.png',
      'assets/images/Visaimage.png',
      'assets/images/Google pay.png',
    ];
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Property Policies', style: mediumtextstylelight),
          sizedbox(height * 0.02, 0.0),
          for (int i = 0; i < 5; i++)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                i != 1
                    ? Icon(
                        icons[i],
                        color: Colors.grey.shade400,
                      )
                    : Container(
                        height: height * 0.025,
                        width: width * 0.015,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/Hotel_Bell_Icon.png'),
                          ),
                        ),
                      ),
                sizedbox(0.0, width * 0.01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(headings[i], style: smallboldTextStyle),
                    sizedbox(height * 0.02, 0.0),
                    Text(
                      policiesTexts[i],
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    sizedbox(height * 0.01, .0),
                    i == 2
                        ? SizedBox(
                            width: width * 0.65,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Children of 12 y.o. and above are considered adults at this property.',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                sizedbox(height * 0.015, .0),
                                Text(
                                  'Crib and extra bed policies:',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                sizedbox(height * 0.01, .0),
                                Text(
                                  '0 - 3 years old — crib upon request for free.',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                sizedbox(height * 0.01, .0),
                                Text(
                                  'The number of cribs allowed depends on the room type you choose. '
                                  'Please check the maximum capacity of the room you have selected.'
                                  ' All cribs and extra beds are subject to availability.',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    sizedbox(height * 0.02, .0),
                  ],
                )
              ],
            ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.025),
            child: Row(
              children: List.generate(
                3,
                (index) => Container(
                  height: height * 0.05,
                  width: width * 0.042,
                  margin: EdgeInsets.only(right: width * 0.01),
                  padding: EdgeInsets.all(height * 0.008),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      logopath[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row similarHotelsListRow(double width, double height, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        3,
        (index) => InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailePageDesktop(),));
          },
          child: Container(
            width: width * 0.225,
            padding: EdgeInsets.only(bottom: height * 0.02),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/uk.jpeg'),
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(5),
                    ),
                  ),
                ),
                sizedbox(height * 0.01, 0.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      StarRating(
                        height: height * 0.018,
                        color: Colors.black,
                        rating: 5,
                        starCount: 5,
                      ),
                      sizedbox(0.0, width * 0.006),
                      Text('Resorts', style: smallTextStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.135,
                        child: Text(
                          'Burj Al Arab Jumeirah',
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$1,857',
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Consumer<FeaturesProvider>(
                            builder: (context, value, child) => Text(
                              'For ${value.nights} Night',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                color: Colors.black87,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradiantButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback onpressed;
  const GradiantButton({
    super.key,
    required this.height,
    required this.width,
    required this.onpressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 105, 227, 255),
              Color.fromARGB(255, 255, 176, 248),
              Color.fromARGB(255, 255, 248, 184)
            ],
          ),
        ),
        child: Center(
          child: Text(text, style: smallTextStyle),
        ),
      ),
    );
  }
}
