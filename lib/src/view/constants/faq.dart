import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/search_bar.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AppBar
      appBar: AppBar(
        surfaceTintColor: blackShadeColor,
        backgroundColor: blackShadeColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Tuchtrip',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              IconlyLight.chat,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: blackShadeColor,
              height: height * 0.88,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Customer Support', style: heading),
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
                ],
              ),
            ),
            Column(
              children: [
                sizedbox(height * 0.05, width),
                Text(
                  'Topics',
                  style: headingblack,
                ),
                sizedbox(height * 0.02, width),
                Container(
                  height: height * 0.20,
                  width: width * 0.80,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 2),
                        blurRadius: 4,
                        color: Color.fromARGB(47, 80, 79, 79),
                      ),
                      BoxShadow(
                        offset: Offset(-2, -0),
                        blurRadius: 4,
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'About us',
                      style: smallboldTextStyle,
                    ),
                  ),
                ),
                sizedbox(height * 0.02, width),
                Container(
                  height: height * 0.20,
                  width: width * 0.80,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 2),
                        blurRadius: 4,
                        color: Color.fromARGB(47, 80, 79, 79),
                      ),
                      BoxShadow(
                        offset: Offset(-2, -0),
                        blurRadius: 4,
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Support contacts',
                      style: smallboldTextStyle,
                    ),
                  ),
                ),
                sizedbox(height * 0.02, width),
                Container(
                  height: height * 0.20,
                  width: width * 0.80,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 2),
                        blurRadius: 4,
                        color: Color.fromARGB(47, 80, 79, 79),
                      ),
                      BoxShadow(
                        offset: Offset(-2, -0),
                        blurRadius: 4,
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Tuch Loyalty Program',
                      style: smallboldTextStyle,
                    ),
                  ),
                ),
                sizedbox(height * 0.02, width),
                Container(
                  height: height * 0.20,
                  width: width * 0.80,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 2),
                        blurRadius: 4,
                        color: Color.fromARGB(47, 80, 79, 79),
                      ),
                      BoxShadow(
                        offset: Offset(-2, -0),
                        blurRadius: 4,
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                SizedBox(height: height * 0.90, child: ArticleList()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleList extends StatelessWidget {
  final List<String> articles = [
    'Will I Get a Reward If I Have Booked a Ticket or Hotel but Missed My Trip?',
    'How Does the Tuch Loyalty Programme Work?',
    'Where Can I Collect Stickers During My Trip?',
    'Can I Transfer My Stickers to Someone Else?',
    'How Do I Join the Tuch Loyalty Programme?',
    'Can I Earn Stickers Without Booking a Stay?',
    'How Do I Contact Support for Issues with My Stickers?',
    'Can I Earn Stickers Without Booking a Stay?',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Promoted articles',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        articles[index],
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        // Handle article tap
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
