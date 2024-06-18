import 'package:flutter/material.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/search_bar.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/Mobile/profile/profile_screen.dart';
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
                  sizedbox(height * 0.02, width),
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
                      'About us',
                      style: smallboldTextStyle,
                    ),
                  ),
                ),
                ArticleList(),
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
    'Which digital wallet can I use to store my collectible Planet?',
    'What is a digital wallet?',
    'What blockchain are these NFTs minted on?',
    'How to pay for your trip with crypto?',
    'What is cryptocurrency?',
    'Will I get a planet reward if I have booked a ticket or hotel but missed my trip?',
    'When can I add a planet to my planetary system?',
    'What is an NFT?',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                  children: <Widget>[
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
                    Divider(),
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
