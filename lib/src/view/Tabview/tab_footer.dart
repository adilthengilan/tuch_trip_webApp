import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/constants/aboutus.dart';
import 'package:tuch/src/view/constants/contact_details.dart';
import 'package:tuch/src/view/constants/cookies.dart';
import 'package:tuch/src/view/constants/faq.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class TabFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.black,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedbox(height * 0.05, width),
            sizedbox(height * 0.03, width),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Text(
                      'Tuch Trip',
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        color: backgroundColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // About Us section
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Aboutus()));
                        },
                        child: Text('About Us', style: smallTextstylewhite),
                      ),
                      // B2B Solutions section
                      TextButton(
                        onPressed: () {},
                        child:
                            Text('B2B Solutions', style: smallTextstylewhite),
                      ),
                      // Contacts section
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Contact()));
                        },
                        child: Text('Contacts', style: smallTextstylewhite),
                      ),
                      // FAQ section
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Faq()));
                        },
                        child: Text('FAQ', style: smallTextstylewhite),
                      ),
                      //User Agreement
                      TextButton(
                        onPressed: () {},
                        child:
                            Text('User Agreement', style: smallTextstylewhite),
                      ),
                      //Privacy Policy
                      TextButton(
                        onPressed: () {},
                        child:
                            Text('Privacy Policy', style: smallTextstylewhite),
                      ),
                      //Cookies Policy
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CookiesPolicy()));
                        },
                        child:
                            Text('Cookies Policy', style: smallTextstylewhite),
                      ),
                    ],
                  ),
                  sizedbox(height * 0.02, width),
                  accounts(),
                ],
              ),
            ),
            sizedbox(height * 0.10, width),
            SizedBox(
              width: width * 0.560,
              child: Text(
                'The contents of this website are subject to copyright protection. ©2024 ONLINE TRAVEL SOLUTIONS - FZCO. All rights reserved. No contents of this website may be copied, used, distributed or modified. Solartrip shall not be held liable for the content of any external websites.',
                style: lightsmalltext,
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget accounts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 40,
            width: 40,
            child: Image(
                image:
                    AssetImage('assets/images/facebk-removebg-preview.png'))),
        Container(
            height: 30,
            width: 30,
            child: Image(
                image: AssetImage('assets/images/insta-removebg-preview.png'))),
        Container(
            height: 40,
            width: 40,
            child: Image(
                image: AssetImage('assets/images/xtw-removebg-preview.png'))),
      ],
    );
  }
}