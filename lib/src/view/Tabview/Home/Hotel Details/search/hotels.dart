// Import necessary libraries
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/hotel_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/footer.dart';
import 'package:tuch/src/view/Common%20widget/search_bar.dart';
import 'package:tuch/src/view/Mobile/Home/Hotel%20Details/hotel_details.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/Mobile/location_searcher/location_service.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class HotelListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final hotels = Provider.of<HotelProvider>(context).hotels;

    return Scaffold(
      backgroundColor: backgroundColor,
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AppBar
      appBar: AppBar(
        surfaceTintColor: backgroundColor,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Tuch Trip',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(IconlyLight.chat),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_2_outlined, color: blackShadeColor),
            onPressed: () {},
          ),
        ],
      ),
      //>.............................................................................................................................
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.06,
              margin: EdgeInsets.only(top: height * 0.04),
              width: width * 0.900,
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Dubai, UAE',
                          style: GoogleFonts.montserrat(fontSize: 10),
                        ),
                        Text(
                          ' Jun 18 — 19, 2 guests, 1 room',
                          style: GoogleFonts.montserrat(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocationSearchScreen()));
                      },
                      icon: Icon(
                        Icons.search,
                        size: 14,
                      )),
                ],
              ),
            ),
            //................................................... search bar ,.........................................................
            sizedbox(height * 0.03, width),
            Container(
              height: height * 0.065,
              width: width,
              margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(09),
                  border: Border.all(color: greyShadeMedium)),
              child: TextField(
                // controller: controller,
                // onChanged: onChange,

                decoration: InputDecoration(
                    icon: Padding(
                      padding: EdgeInsets.only(left: 9),
                      child: Icon(
                        Icons.search,
                        size: 20,
                      ),
                    ),
                    prefixIconColor: greyShadeLight,
                    border: InputBorder.none,
                    hintText: ('Search by hotel name'),
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: greyShadeLight,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.only(bottom: height * 0.02)),
              ),
            ),
            //........................................... List of hotels ...................................................
            sizedbox(height * 0.03, width),
            ListView.builder(
              shrinkWrap: true,
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return HotelCard(hotel: hotel);
              },
            ),
            sizedbox(height * 0.30, width),
            Footer(),
            //...................................................................................................................
          ],
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  HotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          right: width * 0.04, left: width * 0.04, top: height * 0.04),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HotelDetailScreen()));
        },
        child: Container(
          width: width * 0.860,
          height: height * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
              color: backgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: height * 0.22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(09),
                      topRight: Radius.circular(09)),
                  image: DecorationImage(
                      image: AssetImage(
                        hotel.imageUrl,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              sizedbox(height * 0.02, width),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.03),
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
                          hotel.name,
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${hotel.location}',
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                        Text(
                          'Cashback: \$${hotel.cashback}',
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${hotel.price}',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Including taxes and fees',
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                        Text(
                          'For 1 Night',
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: Row(
                  children: [
                    Icon(
                      Icons.payment,
                      size: 14,
                    ),
                    Text(
                      'Pay Now',
                      style: GoogleFonts.montserrat(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
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
}
