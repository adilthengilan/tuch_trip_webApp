import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/dashboard_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/app_text_button.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/Mobile/Search/search_screen.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class TabViewHome extends StatelessWidget {
  const TabViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: blackShadeColor, // Setting the background color
      body: SingleChildScrollView(
        child: Column(children: [
          sizedbox(height * 0.03, width),
          //-------------------------------------------- Top Bar--------------------------------------------------------------------

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Menu Icon
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DrawerScreen()));
                },
              ),
              // Logo
              Text('Tuch Trip', style: heading),
              // Profile Icon
              IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white),
                onPressed: () {
                  // Handle profile action
                },
              ),
            ],
          ),
          //--------------------------------------------------------------------------------------------------------------------------------
          //--------------------------------------------------Headline-----------------------------------------------------------------------
          sizedbox(height * 0.09, width),
          Padding(
            padding: EdgeInsets.only(left: width * 0.15, right: width * 0.10),
            child: Column(
              children: [
                // Title
                SizedBox(
                  width: width * 0.900,
                  child: Text(
                      'Explore Hundreds of Premium Hotels : \nFind Your Perfect Stay',
                      style: heading2),
                ),
                //------------------------------------------------------------------------------------------------------------------------------------
                sizedbox(height * 0.09, width),
                // // Tabs for Stays and Flights
                // ChoiceChip(
                //   label: Text('Stays'),
                //   selected: true,
                //   onSelected: (selected) {},
                //   selectedColor: const Color.fromARGB(255, 188, 116, 116),
                //   backgroundColor: Colors.grey[800],
                //   labelStyle:
                //       TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
                // ),
                //-----------------------------------------------Location search and rooms ,guests.calender widget-----------------------------------------
                LocationDatePersonCountBox(height, width, context),
                sizedbox(height * 0.29, width),
                //_______________________________________________________ an ad of our  quality of booking __________________________________________
                Text('Your smart', style: largeboldstyle),
                Text(
                  'booking\n experience',
                  style: largenormalstyle,
                  textAlign: TextAlign.center,
                ),
                sizedbox(height * 0.03, width),
                Container(
                    height: height * 0.60,
                    width: width * 0.900,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/luxury hotel.jpg',
                            ),
                            fit: BoxFit.fill)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          sizedbox(height * 0.04, width),
                          Text('Stays & flights', style: mediumtextstyle),
                          Text(
                              'Experience the world with our wide selection of stays.',
                              style: smallTextstylewhite),
                        ])),
                //_______________________________________________________________________________________________________________________________________________
                sizedbox(height * 0.20, width),
                Text('Pay your way', style: largeboldstyle),
                Text('Cards or pays', style: largenormalstyle),
                sizedbox(height * 0.02, width),

                Container(
                  height: height * 0.40,
                  width: width * 0.900,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/bank cards.png',
                          ),
                          fit: BoxFit.fill)),
                ),
                sizedbox(height * 0.05, width),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'AI-powered\n customer support',
                      style: mediumtextstyle,
                      textAlign: TextAlign.center,
                    ),
                    Text('Immediate expert assistance via chat.\nAnytime',
                        textAlign: TextAlign.center,
                        style: smallTextstylewhite),
                    sizedbox(height * 0.02, width),
                    Container(
                      height: height * 0.40,
                      width: width * 0.50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/ai powerd chats.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.99,
                  width: width * 0.900,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/loyalty.png'))),
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.69),
                    child: Column(children: [
                      Text(
                        'Tuch Loyalty Program',
                        style: largeboldstyle,
                      ),
                      Text(
                        'Explore the world and collect digital rewards.Refer friends and earn three Planet collectibles',
                        style: smallTextstylelight,
                        textAlign: TextAlign.center,
                      ),
                      sizedbox(height * 0.02, width),
                      Container(
                        height: height * 0.06,
                        width: width * 0.900,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 163, 238, 255),
                              Color.fromARGB(255, 252, 215, 249),
                            ])),
                        child: Center(
                          child: Text(
                            'Open program details',
                            style: smallTextStyle,
                          ),
                        ),
                      ),
                      sizedbox(height * 0.01, width),
                      Container(
                        height: height * 0.06,
                        width: width * 0.900,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(-0.3, 1),
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.normal,
                                  spreadRadius: 0,
                                  color: greyShadeDark),
                            ],
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            'Invite friends',
                            style: smallTextstylelight,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                sizedbox(height * 0.06, width),
                Column(
                  children: [
                    Text(
                      'Ultimate travel app',
                      style: mediumtextstyle,
                    ),
                    Text(
                      'Change the way you travel',
                      style: smallTextstylelight,
                    )
                  ],
                ),
                sizedbox(height * 0.04, width),

                Column(
                  children: [
                    Text(
                      'Choose your next\n destination',
                      style: mediumtextstyle,
                      textAlign: TextAlign.center,
                    ),
                    sizedbox(height * 0.04, width),
                    chooseDestinations(height, width),
                  ],
                ),
                sizedbox(height * 0.18, width),

                Column(
                  children: [
                    // Logo
                    Text('Tuch Trip', style: heading),
                    sizedbox(height * 0.03, width),

                    // About Us section
                    TextButton(
                      onPressed: () {},
                      child: Text('About Us', style: smallTextstylewhite),
                    ),
                    // B2B Solutions section
                    TextButton(
                      onPressed: () {},
                      child: Text('B2B Solutions', style: smallTextstylewhite),
                    ),
                    // Contacts section
                    TextButton(
                      onPressed: () {},
                      child: Text('Contacts', style: smallTextstylewhite),
                    ),
                    // FAQ section
                    TextButton(
                      onPressed: () {},
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
                      onPressed: () {},
                      child: Text('Cookies Policy', style: smallTextstylewhite),
                    ),

                    sizedbox(height * 0.02, width),

                    accounts(),
                    sizedbox(height * 0.02, width),
                    SizedBox(
                      width: width * 0.900,
                      height: height * 0.50,
                      child: Text(
                        'The contents of this website are subject to copyright protection. ©2024 ONLINE TRAVEL SOLUTIONS - FZCO. All rights reserved. No contents of this website may be copied, used, distributed or modified. Solartrip shall not be held liable for the content of any external websites.',
                        style: smallTextstylelight,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          // Add more sections as needed
        ]),
      ),
    );
  }

  Widget chooseDestinations(height, width) {
    return SizedBox(
      height: height * 0.40,
      width: width,
      child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          String image = '';
          String title = '';
          VoidCallback onPressed = () {};

          switch (index) {
            case 0:
              title = 'Dubai';
              image = 'assets/images/dubai.jpg';
              break;
            case 1:
              title = 'Jeddah';
              image = 'assets/images/jeddhah.jpeg';
              break;
            case 2:
              title = 'Germany';
              image = 'assets/images/uk.jpeg';
              break;
            case 3:
              title = 'Germany';
              image = 'assets/images/uk.jpeg';
              break;
            case 4:
              title = 'Germany';
              image = 'assets/images/uk.jpeg';
              break;

            default:
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: ClipOval(
                    child: Image.asset(
                      image,
                      height: height * 0.40,
                      width: height * 0.36,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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

  //This has Location searcher, Choose Your Dates, How many persons booking
//Its in a Container with BoxShadow the provided a column
//In the Column Has 3 Containers and a AppTextButton
//The Three container are indicates, Location searcher, Choosing Dates, Room Count and Persons Count
  Widget LocationDatePersonCountBox(height, width, context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 163, 238, 255),
            Color.fromARGB(255, 252, 215, 249),
          ],
        ),
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
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: List.generate(
              3,
              (index) {
                // final calendarProvider = Provider.of<CalendarProvider>(context);
                // final bottomSheet =
                //     Provider.of<DashBoardProvider>(context, listen: false);
                IconData icon = Icons.circle;
                String text = "";
                Color iconColor = Colors.black;
                VoidCallback onpressed = () {};
                switch (index) {
                  case 0:
                    icon = Icons.search;
                    text = 'Where would you like to go?';
                    iconColor = Colors.blueAccent;
                    onpressed = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                      );
                    };
                  case 1:
                    icon = Icons.calendar_today_outlined;
                    text =
                        // calendarProvider.selectedDates.isEmpty
                        'Choose Your Dates';
                    iconColor = Colors.pinkAccent;
                    onpressed = () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => BookingCalendarPage(),
                      //   ),
                      // );
                    };
                  case 2:
                    icon = Icons.person_outline_outlined;
                    text = ' Rooms,  Adul, children';
                    iconColor = Colors.black54;
                    onpressed = () {
                      // showBottomSheet(context);
                    };
                    break;
                  default:
                }
                return InkWell(
                  onTap: onpressed,
                  child: Container(
                    height: height * 0.083,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        AppIcon(
                          iconData: icon,
                          color: iconColor,
                          height: height * 0.04,
                        ),
                        sizedbox(0.0, width * 0.04),
                        Text(text, style: smallTextStyle),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(height * 0.02),
            child: Consumer<DashBoardProvider>(
              builder: (context, value, child) => AppTextButton(
                text: "Search",
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 51, 192, 252),
                    Color.fromARGB(255, 22, 228, 251)
                  ],
                ),
                height: height,
                width: width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
