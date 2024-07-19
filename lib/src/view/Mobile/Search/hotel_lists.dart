// Import necessary libraries
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/hotel_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/search_bar.dart';
import 'package:tuch/src/view/Mobile/Home/Hotel%20Details/hotel_details.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/Mobile/profile/profile_screen.dart';
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
      drawer: DrawerScreen(),
      appBar: AppBar(
        backgroundColor: blackShadeColor,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: backgroundColor,
              ));
        }),
        title: Text('Tuch Trip', style: heading),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
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
      body: Column(
        children: [
          Container(
            height: height * 0.06,
            margin: EdgeInsets.only(top: height * 0.05),
            width: width * 0.900,
            color: Colors.grey[200],
            child:
                Center(child: Text('Dubai, UAE Jun 18 — 19, 2 guests, 1 room')),
          ),
          sizedbox(height * 0.03, width),
          AppSearchBar(
            hintText: "Search",
            width: width * 0.900,
            height: height,
            prefixIcon: Icon(
              Icons.search,
              color: greyShadeDark,
            ),
          ),
          sizedbox(height * 0.05, width),
          Expanded(
            child: ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return HotelCard(hotel: hotel);
              },
            ),
          ),
        ],
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
          right: width * 0.06, left: width * 0.06, top: height * 0.04),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HotelDetailScreen()));
        },
        child: Container(
          width: width * 0.860,
          height: height * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                height: height * 0.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('${hotel.location}'),
                        Text('Cashback: \$${hotel.cashback}'),
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text('Including taxes and fees'),
                        Text(
                          'For 1 Night',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                  children: [Icon(Icons.payment), Text('Pay Now')],
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
