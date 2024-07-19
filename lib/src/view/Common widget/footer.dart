import 'package:flutter/material.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/constants/aboutus.dart';
import 'package:tuch/src/view/constants/contact_details.dart';
import 'package:tuch/src/view/constants/cookies.dart';
import 'package:tuch/src/view/constants/faq.dart';
import 'package:tuch/utils/textstyles.dart';

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
              style: smallTextStyle,
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