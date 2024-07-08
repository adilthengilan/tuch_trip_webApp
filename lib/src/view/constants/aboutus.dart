import 'package:flutter/material.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/footer.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/Tabview/Home/Booking/booking.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: blackShadeColor,
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
            icon: Icon(Icons.person_2_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedbox(height * 0.25, width),
            Center(
              child: Column(
                children: [
                  Text(
                    'We fuse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'Travel and tech',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'to push the boundaries\nof self-discovery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            sizedbox(height * 0.80, width),
            Center(
              child: Column(
                children: [
                  Text(
                    'Embark with',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'TuchTrip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizedbox(height * 0.05, width),
                  SizedBox(
                    width: width * 0.900,
                    child: Text(
                      'We’re living on a planet full of endless possibilities, hundreds of countries to discover, thousands of experiences to live, and it makes our life extremely interesting, but also overwhelming and challenging. We craft Tuchtrip with a focus on a world where each choice shapes our journey, where the power of a reliable service with personalized approach, honest opinions and expert support, holds immense value.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  sizedbox(height * 0.05, width),
                  SizedBox(
                    width: width * 0.900,
                    child: Text(
                      'As an innovative and forward-thinking travel solution, we embody everything that affluent travelers need, but go even further and beyond their expectations. By embracing new concepts and smart technologies, we stay ahead of the curve in the ever-evolving travel landscape.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizedbox(height * 0.09, width),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Connect with us',
                  style: heading,
                ),
                sizedbox(height * 0.05, width),
                const Text(
                  ' We\'re here for your questions,\n collaboration ideas, and feedback.\nShape the travel future with us!',
                  style: TextStyle(
                    color: backgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.04, bottom: height * 0.06),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        // => launch('mailto:media@solartrip.com'),
                        child: Container(
                            height: height * 0.05,
                            width: width * 0.500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 65, 64, 64),
                            ),
                            child: Center(
                              child: Text(
                                'media@tuchtrip.com',
                                style: TextStyle(color: backgroundColor),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      sizedbox(height * 0.02, width),
                      InkWell(
                        onTap: () { },
                        // => launch('mailto:media@solartrip.com'),
                        child: Container(
                            height: height * 0.05,
                            width: width * 0.500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 65, 64, 64),
                            ),
                            child: Center(
                              child: Text(
                                'support@Tuchtrip.com',
                                style: TextStyle(
                                  color: backgroundColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      sizedbox(height * 0.03, width),
                      accounts(),
                      sizedbox(height * 0.10, width),
                      Footer(),
                    ],
                  ),
                ),
              ],
            ),
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
            height: 60,
            width: 60,
            child: Image(
                image:
                    AssetImage('assets/images/facebk-removebg-preview.png'))),
        Container(
            height: 50,
            width: 50,
            child: Image(
                image: AssetImage('assets/images/insta-removebg-preview.png'))),
        Container(
            height: 60,
            width: 60,
            child: Image(
                image: AssetImage('assets/images/xtw-removebg-preview.png'))),
      ],
    );
  }
}
