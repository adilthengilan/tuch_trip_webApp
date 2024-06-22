import 'package:flutter/material.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/Mobile/profile/profile_screen.dart';
import 'package:tuch/src/view/constants/aboutus.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

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
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              top: height * 0.05,
              bottom: height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle Customer Support tap
                    },
                    child: Text(
                      'Solartrip Customer Support',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Text(' > '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Aboutus()));
                    },
                    child: Text(
                      'About us',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ExpansionTile(
                title: Text(
                  'Articles in this section',
                  style: smallTextStyle,
                ),
              ),
              sizedbox(height * 0.08, width),
              Text(
                'Tuchtrip contacts',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedbox(height * 0.08, width),
              Text(
                'Tuchtrip Customer Support team is ready to assist you 24/7 at',
                style: smallTextStyle,
              ),
              sizedbox(height * 0.02, width),
              GestureDetector(
                onTap: () {
                  // Handle email tap
                },
                child: Text(
                  'support@Tuchtrip.com',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              sizedbox(height * 0.05, width),
              Text(
                'You can also send your request via',
                style: smallTextStyle,
              ),
              sizedbox(height * 0.02, width),
              GestureDetector(
                onTap: () {
                  // Handle Contact Us Form tap
                },
                child: Text(
                  'Contact Us Form',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              sizedbox(height * 0.05, width),
              Text(
                "We'll be more than happy to help.",
                style: smallTextStyle,
              ),
              sizedbox(height * 0.05, width),
              Text(
                'Address',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedbox(height * 0.03, width),
              Text(
                'Online Travel Solutions FZCO',
                style: smallTextStyle,
              ),
              Text(
                'DSO-FZCO-14423',
                style: smallTextStyle,
              ),
              Text(
                'Dubai Silicon Oasis',
                style: smallTextStyle,
              ),
              Text(
                'Dubai Digital Park',
                style: smallTextStyle,
              ),
              Text(
                'Building A1 Dubai',
                style: smallTextStyle,
              ),
              Text(
                'United Arab Emirates',
                style: smallTextStyle,
              ),
              sizedbox(height * 0.10, width),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have more questions?',
                    style: smallTextStyle,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Submit a request',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
