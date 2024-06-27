import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/calender_provider.dart';
import 'package:tuch/src/view%20model/dashboard_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/app_text_button.dart';
import 'package:tuch/src/view/Mobile/Search/hotel_lists.dart';
import 'package:tuch/src/view/Mobile/Search/search_screen.dart';
import 'package:tuch/src/view/Tabview/Home/Hotel%20Details/search/hotels.dart';
import 'package:tuch/src/view/Tabview/tab_footer.dart';
import 'package:tuch/src/view/constants/aboutus.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/constants/calender_screen.dart';
import 'package:tuch/src/view/constants/contact_details.dart';
import 'package:tuch/src/view/constants/cookies.dart';
import 'package:tuch/src/view/constants/faq.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class TabviewHome extends StatelessWidget {
  const TabviewHome({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: blackShadeColor,
      //___________________________________________________AppBar______________________________________________________________
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
      //________________________________________________________________________________________________________________________________
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.10, right: width * 0.10),
            child: Column(
              children: [
                //--------------------------------------------------------------------------------------------------------------------------------
                //--------------------------------------------------Headline-----------------------------------------------------------------------
                // Title
                sizedbox(height * 0.15, width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tuchtrip', style: largeHeadingsmv),
                    Text(
                      'Travel Service',
                      style: largeHeadingsmvlight,
                    )
                  ],
                ),
                //------------------------------------------------------------------------------------------------------------------------------------
                sizedbox(height * 0.09, width),
                // // Tabs for Stays
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
                sizedbox(height * 0.02, width),
                LocationDatePersonCountBox(height, width, context),
                sizedbox(height * 0.29, width),
                //_______________________________________________________ an ad of our  quality of booking __________________________________________
                Text('Your smart', style: largeboldstyle),
                Text('booking\n experience',
                    style: largenormalstyle, textAlign: TextAlign.center),
                sizedbox(height * 0.03, width),
                AdSection(
                  image: 'assets/images/luxury hotel.jpg',
                  title: 'Stays & flights',
                  caption:
                      'Experience the world with our wide selection of stays',
                ),
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
                sizedbox(height * 0.10, width),
                //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> section of ai powerd customer support>>>>>>>>>>>>>>>>>>>>>>

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
                //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Loyalty program>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                LoyaltyProgramSection(),
                //___________________________________________________________ Our application image like availability appstore/play store..........loading.....................
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
              ],
            ),
          ),

          //Loading.................................................................................
          sizedbox(height * 0.10, width),
          //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; choose destinations

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
          //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          sizedbox(height * 0.25, width),
          TabFooter(),
        ]),
      ),
    );
  }

//___________________________________________________Choose destinaton category when tap move search filtered destinations>>>>>>>>.
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
              onPressed = () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              };
              break;
            case 1:
              title = 'Jeddah';
              image = 'assets/images/jeddhah.jpeg';
              onPressed = () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              };

              break;
            case 2:
              title = 'Germany';
              image = 'assets/images/uk.jpeg';
              onPressed = () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              };

              break;
            case 3:
              title = 'Germany';
              image = 'assets/images/uk.jpeg';
              onPressed = () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              };

              break;
            case 4:
              title = 'Germany';
              image = 'assets/images/uk.jpeg';
              onPressed = () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              };

              break;

            default:
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: InkWell(
                    onTap: onPressed,
                    child: ClipOval(
                      child: Image.asset(
                        image,
                        height: height * 0.40,
                        width: height * 0.36,
                        fit: BoxFit.cover,
                      ),
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
                final calendarProvider = Provider.of<CalendarProvider>(context);
                final bottomSheet =
                    Provider.of<DashBoardProvider>(context, listen: false);
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
                    text = calendarProvider.selectedDates.isEmpty
                        ? 'Choose Your Dates'
                        : '${calendarProvider.checkingDate} - ${calendarProvider.checkoutDate}  ${calendarProvider.selectedDates.length - 1} Night';
                    iconColor = Colors.pinkAccent;
                    onpressed = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingCalendarPage(),
                        ),
                      );
                    };
                  case 2:
                    icon = Icons.person_outline_outlined;
                    text =
                        '${bottomSheet.rooms} Rooms, ${bottomSheet.adults} Adults, ${bottomSheet.children} children';
                    iconColor = Colors.black54;
                    onpressed = () {
                      showBottomSheet(context, height, width);
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TabHotelsList()));
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

//========================================================================================================
//================================ This Bottom Sheet func for Pick persons Count ==========================
//=========================================================================================================
void showBottomSheet(BuildContext context, height, width) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
    backgroundColor: backgroundColor,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BottomSheetContent(height: height, width: width);
    },
  );
}

class BottomSheetContent extends StatelessWidget {
  final double height;
  final double width;
  const BottomSheetContent({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final bottomSheet = Provider.of<DashBoardProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.045,
          vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Rooms and Guests',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Consumer<DashBoardProvider>(
                builder: (context, bottomsheet, child) =>
                    buildDropdown('Rooms', bottomsheet.rooms, (value) {
                  bottomsheet.setRoomCount(value);
                }),
              ),
              Consumer<DashBoardProvider>(
                builder: (context, bottomSheet, child) =>
                    buildDropdown('Adults', bottomSheet.adults, (value) {
                  bottomSheet.setAdultsCount(value);
                }),
              ),
              Consumer<DashBoardProvider>(
                builder: (context, bottomSheet, child) =>
                    buildDropdown('Children', bottomSheet.children, (value) {
                  bottomSheet.setChildrenCount(value);
                }),
              ),
              sizedbox(height * 0.02, 0.0),
              if (bottomSheet.children > 0) ..._buildChildrenAges(context),
              sizedbox(height * 0.02, 0.0),
              Text(
                'To get the best prices and options, please tell us how many children you have and how old they are.',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
              sizedbox(height * 0.02, 0.0),
              Consumer<DashBoardProvider>(
                builder: (context, bottomsheet, child) => AppTextButton(
                  text: 'Submit',
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 51, 192, 252),
                      Color.fromARGB(255, 22, 228, 251)
                    ],
                  ),
                  onPressed: () {
                    bottomsheet.submitingRoomsGuestCount(context);
                  },
                  height: height,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, int value, ValueChanged onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18.0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: DropdownButton<int>(
                value: value,
                onChanged: onChanged,
                items: List.generate(60, (index) => index)
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString().padLeft(2, '0')),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChildrenAges(context) {
    final bottomSheet = Provider.of<DashBoardProvider>(context);
    List<Widget> childrenAgesWidgets = [];
    for (int i = 0; i < bottomSheet.children; i++) {
      childrenAgesWidgets.add(
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Child ${i + 1} Age',
                style: TextStyle(fontSize: 18.0),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Consumer<DashBoardProvider>(
                  builder: (context, guest, child) => DropdownButton<int>(
                      value: guest.childrenAges[i],
                      onChanged: (int? newValue) {
                        guest.setChildrenAges(newValue, i);
                      },
                      items: List.generate(18, (index) => index)
                          .map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString().padLeft(2, '0')),
                        );
                      }).toList()),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return childrenAgesWidgets;
  }
}
//===========================================================================================================================================================
//===========================================================================================================================================================
//===========================================================================================================================================================

// Section for advertisement
class AdSection extends StatelessWidget {
  final String image;
  final String title;
  final String caption;
  const AdSection(
      {Key? key,
      required this.image,
      required this.title,
      required this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.60,
      width: width * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          sizedbox(height * 0.04, width),
          Text(title, style: mediumtextstyle),
          Text(caption, style: smallTextstylewhite),
        ],
      ),
    );
  }
}

//..........................................................................................................................................................
// Section for loyalty program
class LoyaltyProgramSection extends StatelessWidget {
  const LoyaltyProgramSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: height * 0.90,
          width: width * 0.90,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/loyalty.png')),
          ),
          child: Column(
            children: [
              sizedbox(height * 0.70, width),
              Text('Tuch Loyalty Program', style: largeboldstyle),
              Text(
                'Explore the world and collect digital rewards.\nRefer friends and earn three Planet collectibles',
                style: smallTextstylelight,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        ProgramDetailsButton(height: height, width: width),
        sizedbox(height * 0.02, width),
        InviteFriendsButton(height: height, width: width),
      ],
    );
  }
  //******************************************************************************************************************************************************* */
}

// Button for program details
class ProgramDetailsButton extends StatelessWidget {
  final double height;
  final double width;

  const ProgramDetailsButton({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 163, 238, 255),
          Color.fromARGB(255, 252, 215, 249),
        ]),
      ),
      child: Center(
        child: Text('Open program details', style: smallTextStyle),
      ),
    );
  }
}

// Button for inviting friends
class InviteFriendsButton extends StatelessWidget {
  final double height;
  final double width;

  const InviteFriendsButton({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(-0.3, 1),
            blurRadius: 2,
            blurStyle: BlurStyle.normal,
            spreadRadius: 0,
            color: greyShadeDark,
          ),
        ],
        color: Colors.black,
      ),
      child: Center(
        child: Text('Invite friends', style: smallTextstylelight),
      ),
    );
  }
}
