import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/bookingProvider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/app_text_button.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/Mobile/Home/mobile_view_body.dart';
import 'package:tuch/src/view/Tabview/tab_footer.dart';
import 'package:tuch/src/view/constants/aboutus.dart';
import 'package:tuch/src/view/constants/contact_details.dart';
import 'package:tuch/src/view/constants/cookies.dart';
import 'package:tuch/src/view/constants/faq.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class BookingTabview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AppBar
      drawer: DrawerScreen(),
      appBar: AppBar(
        surfaceTintColor: backgroundColor,
        backgroundColor: backgroundColor,
        title: Text('Tuch Trip', style: headingblack),
        actions: [
          IconButton(
            icon: Icon(Icons.person_2_outlined, color: blackShadeColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.03, right: width * 0.03, top: height * 0.04),
              child: Column(
                children: [
                  HotelDetails(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.03, right: width * 0.03, top: height * 0.04),
              child: Container(
                // height: height * 0.40,
                // width: width * 0.950,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(09),
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
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lead guest details',
                        style: GoogleFonts.montserrat(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'We will send you the receipt and booking details',
                        style: GoogleFonts.montserrat(fontSize: 12),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        style: GoogleFonts.montserrat(
                            color: greyShadeMedium, fontSize: 14),
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        style: GoogleFonts.montserrat(
                            color: greyShadeMedium, fontSize: 14),
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          Expanded(
                            child: Text(
                              'I give my consent to the processing of personal data',
                              style: GoogleFonts.montserrat(
                                  color: Color.fromARGB(255, 89, 11, 103),
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.03, right: width * 0.03, top: height * 0.04),
              child: Container(
                // height: height * 0.40,
                // width: width * 0.950,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(09),
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
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lead guest',
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: height * 0.06,
                            width: width * 0.200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 208, 181, 255)),
                            child: Center(
                              child: Text(
                                "Select",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 65, 6, 104)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      TextField(
                        style: GoogleFonts.montserrat(
                            color: greyShadeMedium, fontSize: 14),
                        decoration: InputDecoration(
                          labelText: 'First name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        style: GoogleFonts.montserrat(
                            color: greyShadeMedium, fontSize: 14),
                        decoration: InputDecoration(
                          labelText: 'Second name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'List all guests who will be staying at the hotel',
                              style: GoogleFonts.montserrat(
                                  color: greyShadeMedium, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      sizedbox(height * 0.02, width),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Seacond guest',
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: height * 0.06,
                            width: width * 0.200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 208, 181, 255)),
                            child: Center(
                              child: Text(
                                "Select",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 65, 6, 104)),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      TextField(
                        style: GoogleFonts.montserrat(
                            color: greyShadeMedium, fontSize: 14),
                        decoration: InputDecoration(
                          labelText: 'First name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        style: GoogleFonts.montserrat(
                            color: greyShadeMedium, fontSize: 14),
                        decoration: InputDecoration(
                          labelText: 'Second name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sizedbox(height * 0.02, width),
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
              child: Container(
                // height: height * 0.40,
                // width: width * 0.950,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(09),
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
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Check-in',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold)),
                          Text(
                            'Jun 20 2024, Thu',
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                          Text(
                            'from 15:00',
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Check-out',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold)),
                          Text(
                            'Jun 21 2024, Fri',
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                          Text(
                            'until 12:00',
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sizedbox(height * 0.02, width),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.03,
                right: width * 0.03,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(09),
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
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Price',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 14,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Stay fee',
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                          Text(
                            '750',
                            style: GoogleFonts.montserrat(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxes and fee',
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                          Text(
                            '90',
                            style: GoogleFonts.montserrat(fontSize: 12),
                          )
                        ],
                      ),
                      sizedbox(height * 0.02, width),
                      Container(
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(08),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 163, 238, 255),
                              Color.fromARGB(255, 252, 215, 249),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pay now',
                                style: GoogleFonts.montserrat(fontSize: 12),
                              ),
                              Text(
                                '\$456.27',
                                style: GoogleFonts.montserrat(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.06, left: width * 0.06),
              child: AppTextButton(
                text: "Countinue Booking",
                onPressed: () {},
                height: height,
                width: width,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 155, 231, 248),
                    Color.fromARGB(255, 174, 154, 248),
                    Color.fromARGB(255, 255, 163, 247),
                  ],
                ),
              ),
            ),
            sizedbox(height * 0.08, width),
            TabFooter(),
          ],
        ),
      ),
    );
  }

  Widget promocode(height, width) {
    return Container(
      height: height * 0.10,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
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
      ),
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Promo code or gift certificate',
                  hintStyle: GoogleFonts.montserrat(fontSize: 10),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            InkWell(
              onTap: () {},
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }

  //  // ===================================== CONTACT DETAILS ==================================================
  // Widget contactDetails(height, width, context) {
  //   return Consumer<ContactDetailsProvider>(
  //       builder: (context, contactdetails, child) {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Contact Details',
  //               style: greysmallTextStyle,
  //             ),
  //             InkWell(
  //               onTap: () {
  //                 showBottomSheetcontact(context);
  //               },
  //               child: Icon(
  //                 Icons.edit,
  //                 color: blackShadeColor,
  //               ),
  //             )
  //           ],
  //         ),
  //         sizedBox(height * 0.02, width),
  //         Text(
  //           contactdetails.name,
  //           style: BlackLightTextStyle,
  //         ),
  //         sizedBox(height * 0.01, width),
  //         Text(
  //           contactdetails.email,
  //           style: smallTextStyle,
  //         ),
  //         sizedBox(height * 0.01, width),
  //         Text(
  //           contactdetails.phone,
  //           style: smallTextStyle,
  //         )
  //       ],
  //     );
  //   });
  // }
}

class HotelDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      // height: height * 0.40,
      width: width * 0.950,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(09),
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
            left: width * 0.02,
            top: height * 0.02,
            right: width * 0.03,
            bottom: height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                          "8.9",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ),
                    ),
                    sizedbox(height * 0.01, width * 0.01),
                    Text(
                      'Resort',
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                    sizedbox(height * 0.01, width * 0.01),
                    Row(
                      children: List.generate(
                        5,
                        (index) => ratingStarIcon(height),
                      ),
                    ),
                  ],
                ),
                sizedbox(height * 0.01, width * 0.01),
                Text(
                  'Jumeira minah A`salam - Madinathu\nJumeira',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedbox(height * 0.01, width * 0.01),
                SizedBox(
                  width: width * 0.500,
                  child: Text(
                    "Jubairah beach road,Jumairah madinath resort, United Arab Emirates,Dubai",
                    style: GoogleFonts.montserrat(
                        color: Colors.grey, fontSize: 12),
                  ),
                ),
                sizedbox(height * 0.02, width * 0.01),
                Row(
                  children: [
                    Icon(Icons.date_range, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      'Jun 20 from 15:00 — Jun 21 until 12:00',
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ],
                ),
                sizedbox(height * 0.01, width * 0.01),
                Row(
                  children: [
                    Icon(Icons.cancel, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      'No free cancellation',
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                    sizedbox(height * 0.01, width * 0.01),
                    Icon(Icons.room_service, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      'Room only',
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ],
                ),
                sizedbox(height * 0.01, width * 0.01),
                Row(
                  children: [
                    Icon(Icons.people, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      '2 adults',
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ],
                ),
                sizedbox(height * 0.01, width * 0.01),
                Row(
                  children: [
                    Icon(Icons.room, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      'Deluxe rooms',
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ],
                ),
                sizedbox(height * 0.01, width * 0.01),
                Row(
                  children: [
                    Icon(Icons.bed, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      'Queen bed',
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.22,
                  width: width * 0.24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/luxury hotel.jpg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Rating star
  Widget ratingStarIcon(height) {
    return Icon(
      Icons.star,
      color: orangeColor,
      size: height * 0.02,
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.black,
      ),
      child: Column(
        children: [
          sizedbox(height * 0.05, width),

          // Logo
          Text('Tuch Trip', style: heading),
          sizedbox(height * 0.03, width),

          // About Us section
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Aboutus()));
            },
            child: Text('About Us', style: smallTextstylewhite),
          ),
          // B2B Solutions section
          TextButton(
            onPressed: () {},
            child: Text('B2B Solutions', style: smallTextstylewhite),
          ),
          // Contacts section
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
            child: Text('Contacts', style: smallTextstylewhite),
          ),
          // FAQ section
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Faq()));
            },
            child: Text('FAQ', style: smallTextstylewhite),
          ),
          //User Agreement
          TextButton(
            onPressed: () {},
            child: Text('User Agreement', style: smallTextstylewhite),
          ),
          //Privacy Policy
          TextButton(
            onPressed: () {},
            child: Text('Privacy Policy', style: smallTextstylewhite),
          ),
          //Cookies Policy
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CookiesPolicy()));
            },
            child: Text('Cookies Policy', style: smallTextstylewhite),
          ),

          sizedbox(height * 0.02, width),

          accounts(),
          sizedbox(height * 0.05, width),
          SizedBox(
            width: width * 0.900,
            height: height * 0.25,
            child: Text(
              'The contents of this website are subject to copyright protection. ©2024 ONLINE TRAVEL SOLUTIONS - FZCO. All rights reserved. No contents of this website may be copied, used, distributed or modified. Solartrip shall not be held liable for the content of any external websites.',
              style: lightsmalltext,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget accounts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 50,
            width: 50,
            child: Image(
                image:
                    AssetImage('assets/images/facebk-removebg-preview.png'))),
        Container(
            height: 40,
            width: 40,
            child: Image(
                image: AssetImage('assets/images/insta-removebg-preview.png'))),
        Container(
            height: 50,
            width: 50,
            child: Image(
                image: AssetImage('assets/images/xtw-removebg-preview.png'))),
      ],
    );
  }
}
