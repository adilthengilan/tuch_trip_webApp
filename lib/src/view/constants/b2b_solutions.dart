import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/footer.dart';
import 'package:tuch/utils/app_colors.dart';

class B2bSolutions extends StatelessWidget {
  const B2bSolutions({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final TextEditingController namecontroller = TextEditingController();
    return Scaffold(
      backgroundColor: blackShadeColor,
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AppBar
      appBar: AppBar(
        surfaceTintColor: backgroundColor,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Tuchtrip',
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
            icon: Icon(
              Icons.person_2_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 184, 148, 231),
                    Color(0xFF070707)
                  ],
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      sizedbox(height * 0.20, width),
                      Text(
                        'Empower your business',
                        style: GoogleFonts.montserrat(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'with travel loyalty',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      sizedbox(height * 0.08, width),
                      SizedBox(
                        width: width * 0.600,
                        child: Text(
                          'All-in-one platform for bookings and rewards that keeps your customers coming back and spending more',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: backgroundColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Schedule a demo',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: greyShadeMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sizedbox(height * 0.69, width),
            Text(
              'Travel Loyalty',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Text(
              'Designed for you',
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            sizedbox(height * 0.01, width),
            SizedBox(
              width: width * 0.600,
              child: Text(
                'TuchTrip provides plug-and-play white-label and loyalty software for big consumer businesses to boost customer acquisition and engagement',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            sizedbox(height * 0.20, width),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  right: width * 0.04,
                  top: height * 0.18,
                  bottom: height * 0.20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(09),
                    color: Color.fromARGB(255, 26, 26, 26)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sizedbox(height * 0.04, width),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ready to unlock',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'TuchTrip travel loyalty?',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    sizedbox(height * 0.02, width),
                    Text(
                      'Please leave your details and we’ll get in touch with you shortly ',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    sizedbox(height * 0.04, width),
                    AppTextField(
                        controller: namecontroller,
                        hintText: "Name",
                        width: width,
                        height: height),
                    sizedbox(height * 0.02, width),
                    AppTextField(
                        controller: namecontroller,
                        hintText: "Phone number",
                        width: width,
                        height: height),
                    sizedbox(height * 0.02, width),
                    AppTextField(
                        controller: namecontroller,
                        hintText: "Email",
                        width: width,
                        height: height),
                    sizedbox(height * 0.02, width),
                    Container(
                        height: height * 0.06,
                        width: width * 0.800,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(09),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 163, 238, 255),
                            Color.fromARGB(255, 252, 215, 249),
                          ]),
                        ),
                        child: Center(child: Text("Submit"))),
                    sizedbox(height * 0.03, width),
                    Text(
                      "By clicking'Submit',you agree to the privacy policy",
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    sizedbox(height * 0.07, width),
                  ],
                ),
              ),
            ),
            sizedbox(height * 0.15, width),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;
  final double height;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(09), color: backgroundColor),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12),
          contentPadding: EdgeInsets.only(
              left: 20, top: height * 0.04, bottom: height * 0.03),
        ),
      ),
    );
  }
}