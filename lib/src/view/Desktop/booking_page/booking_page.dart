import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Desktop/Search/searchPage.dart';
import 'package:tuch/src/view/Desktop/desktopview.dart';
import 'package:tuch/src/view/Desktop/details/detail_page.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      //=========== Custom App BAr
      appBar: CustomAppBar(height: height, width: width),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: width * 0.5,
                color: backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedbox(height * 0.12, width),
                    Text('Booking Snapshot', style: mediumtextstylelight),
                    sizedbox(height * 0.02, width),
                    //===================================================================================================================================
                    ///==================================================== Hotel And Rooms Informations And Services ===================================
                    HotelandRoomsInformations(width, height),
                    //===================================================================================================================================
                    //===================================================================================================================================
                    sizedbox(height * 0.02, width),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///===================================================================================================================================
                        //======================================================== Contact Informations =====================================================
                        // ContactInformations(width: width, height: height),
                        Column(
                          children: [
                            Container(
                              width: width * 0.3,
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.02,
                                vertical: height * 0.025,
                              ),
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.grey.shade300,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Lead Guest Info',
                                      style: mediumtextstylelight),
                                  sizedbox(height * 0.01, width),
                                  Text(
                                      'We will send you the receipt and booking details',
                                      style: smallTextStyle),
                                  sizedbox(height * 0.04, width),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: height * 0.06,
                                        width: width * 0.124,
                                        child: CustomTextField(
                                          controller: emailController,
                                          labelText: 'Email',
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.06,
                                        width: width * 0.124,
                                        child: CustomTextField(
                                          controller: phoneNumberController,
                                          labelText: 'Phone Number',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            sizedbox(height * 0.02, 0.0),
                            Container(
                              width: width * 0.3,
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.02,
                                vertical: height * 0.025,
                              ),
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.grey.shade300,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Lead Guest',
                                      style: mediumtextstylelight),
                                  sizedbox(height * 0.02, width),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: height * 0.06,
                                        width: width * 0.124,
                                        child: CustomTextField(
                                          controller: emailController,
                                          labelText: 'First Name',
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.06,
                                        width: width * 0.124,
                                        child: CustomTextField(
                                          controller: emailController,
                                          labelText: 'Last Name',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        ///===================================================================================================================================
                        ///===================================================================================================================================
                        sizedbox(0.0, width * 0.01),
                        Column(
                          children: [
                            ///===================================================================================================================================
                            ///================================================== Check-In & Check-Out Date And Time =============================================
                            checkInAndCheckOutDate(width, height),

                            ///===================================================================================================================================
                            ///===================================================================================================================================
                            sizedbox(height * 0.02, 0.0),

                            ///===================================================================================================================================
                            ///================================================== Payment Informations ===========================================================
                            paymentInformations(width, height),

                            ///===================================================================================================================================
                            ///===================================================================================================================================
                          ],
                        ),
                      ],
                    ),
                    sizedbox(height * 0.04, width),
                    GradiantButton(
                      height: height * 0.06,
                      width: width * 0.2,
                      text: 'Continue Booking',
                      onpressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            sizedbox(height * 0.1, width),
          ],
        ),
      ),
    );
  }

  Container paymentInformations(double width, double height) {
    return Container(
      width: width * 0.19,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.016,
        vertical: height * 0.023,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Price', style: smallTextStyle),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
          sizedbox(height * 0.01, 0.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.006,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Stay Fee',
                      style: GoogleFonts.montserrat(
                          fontSize: 10, color: Colors.black),
                    ),
                    Text(
                      '750',
                      style: GoogleFonts.montserrat(
                          fontSize: 10, color: Colors.black),
                    ),
                  ],
                ),
                sizedbox(height * 0.006, 0.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Taxes and Fee',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '70',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          sizedbox(height * 0.025, 0.0),
          Container(
            height: height * 0.045,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.006),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 176, 248),
                  Color.fromARGB(255, 105, 227, 255),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pay Now', style: smallTextStyle),
                Text('\$1,567', style: smallTextStyle)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row checkInAndCheckOutDate(double width, double height) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.09,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.01,
            vertical: height * 0.023,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey.shade300,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Check - in', style: smallboldTextStyle),
              sizedbox(height * 0.015, 0.0),
              Text('Jun 25 2024,', style: smallTextStyle),
              sizedbox(height * 0.01, 0.0),
              Text(
                'Wed,',
                style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              sizedbox(height * 0.01, 0.0),
              Text('from 15:00', style: smallTextStyle),
            ],
          ),
        ),
        sizedbox(0.0, width * 0.01),
        //=================================================== Chack out ===================================================
        Container(
          width: width * 0.09,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.01,
            vertical: height * 0.023,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey.shade300,
              ),
            ],
          ),
          child: Consumer<FeaturesProvider>(
            builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Check - out', style: smallboldTextStyle),
                sizedbox(height * 0.015, 0.0),
                Text('Jun 30 2024,', style: smallTextStyle),
                sizedbox(height * 0.01, 0.0),
                Text(
                  'Sun,',
                  style: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                sizedbox(height * 0.01, 0.0),
                Text('from 15:00', style: smallTextStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container HotelandRoomsInformations(double width, double height) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: height * 0.034,
                    width: width * 0.023,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.002,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber[400],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text('4.6', style: smallTextStyle),
                    ),
                  ),
                  sizedbox(0.0, width * 0.01),
                  //////===================================================== Type of Stay ===========================================================
                  Text('Hotel', style: smallTextStyle),
                  sizedbox(0.0, width * 0.01),
                  StarRating(
                    height: height * 0.018,
                    color: Colors.yellowAccent,
                    rating: 4.9,
                    starCount: 5,
                  ),
                ],
              ),
              sizedbox(height * 0.015, 0.0),
              ////=========================================================== Name of Stay =====================================================================
              SizedBox(
                width: width * 0.25,
                child: Text(
                  'Jumeirah Al Qasr',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              sizedbox(height * 0.01, 0.0),
              ////============================================================ The Description of Hotel ==========================================================
              SizedBox(
                width: width * 0.3,
                child: Text(
                  'Jumeirah Beach Road, Madinat Jumeirah Resort, United Arab Emirates, Dubai',
                  style: smallTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              sizedbox(height * 0.025, 0.0),
              //////=========================================================== Features of Roooms And Hotels =======================================================
              SizedBox(
                width: width * 0.3,
                child: Wrap(
                  runAlignment: WrapAlignment.start,
                  spacing: height * 0.03,
                  runSpacing: height * 0.01,
                  children: List.generate(
                    6,
                    (index) {
                      final List<Map<String, dynamic>> details = [
                        {
                          'icon': Icons.calendar_today_outlined,
                          'title': 'Jun 25 from 15:00 — Jun 26 until 12:00'
                        },
                        {'icon': Icons.king_bed_outlined, 'title': 'King bed'},
                        {'icon': Icons.people_outlined, 'title': '2 adults'},
                        {
                          'icon': Icons.cancel_outlined,
                          'title': 'No free cancellation'
                        },
                        {'icon': Icons.vpn_key_outlined, 'title': 'Club rooms'},
                        {'icon': Icons.fastfood_outlined, 'title': 'Room only'},
                      ];
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppIcon(
                            iconData: details[index]['icon'],
                            color: Colors.black,
                            height: height * 0.018,
                          ),
                          sizedbox(0.0, width * 0.01),
                          SizedBox(
                            width: width * 0.12,
                            child: Consumer<FeaturesProvider>(
                              builder: (context, value, child) => Text(
                                details[index]['title'],
                                style: smallTextStyle,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: height * 0.25,
            width: width * 0.11,
            margin: EdgeInsets.symmetric(vertical: height * 0.05),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/paris.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactInformations extends StatelessWidget {
  const ContactInformations({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width * 0.3,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.025,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey.shade300,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lead Guest Info', style: mediumtextstylelight),
              sizedbox(height * 0.01, width),
              Text('We will send you the receipt and booking details',
                  style: smallTextStyle),
              sizedbox(height * 0.04, width),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.124,
                    child: CustomTextField(
                      controller: emailController,
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.124,
                    child: CustomTextField(
                      controller: phoneNumberController,
                      labelText: 'Phone Number',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        sizedbox(height * 0.02, 0.0),
        Container(
          width: width * 0.3,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.025,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey.shade300,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lead Guest', style: mediumtextstylelight),
              sizedbox(height * 0.02, width),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.124,
                    child: CustomTextField(
                      controller: emailController,
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.124,
                    child: CustomTextField(
                      controller: emailController,
                      labelText: 'Last Name',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // obscureText: true,
      decoration: InputDecoration(
        fillColor: backgroundColor,
        labelText: labelText,
        labelStyle: smallTextStyle,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.cyanAccent,
          ),
        ),
      ),
    );
  }
}
