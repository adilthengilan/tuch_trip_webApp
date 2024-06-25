import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Desktop/booking_page/booking_page.dart';
import 'package:tuch/src/view/Desktop/search_page/search_page.dart';
import 'package:tuch/utils/textstyles.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

TextEditingController locationController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();

bool locationSearchingList = false;
bool calendarPicker = false;
bool roomsCounter = false;


class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return BookingPage();
  }
}



class HomePageDeskTop extends StatefulWidget {
  const HomePageDeskTop({super.key});

  @override
  State<HomePageDeskTop> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageDeskTop> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          locationSearchingList = false;
          calendarPicker = false;
          roomsCounter = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Tuchtrip', style: heading),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_2_outlined,
                size: height * 0.035,
                color: Colors.white,
              ),
            ),
            sizedbox(0.0, width * 0.02),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedbox(height * 0.25, width),
              Text('Tuchtrip Travel Service', style: largeHeadings),
              sizedbox(height * 0.2, 0.0),
              SearchingBar(height: height, width: width),
              sizedbox(height * 0.3, width),
              Text('Your', style: largeHeadings),
              SizedBox(
                width: width * 0.6,
                child: Text(
                  'booking experience',
                  style: largeHeadings,
                  textAlign: TextAlign.center,
                ),
              ),
              sizedbox(height * 0.03, width),
              Container(
                height: height * 0.45,
                width: width * 0.8,
                padding: EdgeInsets.only(left: width * 0.01, top: height * 0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/luxury hotel.jpg'),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Explore Our Luxury Stays', style: largeboldstyle),
                    SizedBox(
                      width: width * 0.45,
                      child: Text(
                        'Travel the world with our broad selection of stays,'
                        ' offering unique and luxurious accommodations tailored to suit every traveler’s needs and preferences.',
                        style: smallTextstylewhite,
                      ),
                    ),
                  ],
                ),
              ),
              sizedbox(height * 0.04, width),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.46,
                    width: width * 0.39,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade900,
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/smartcheking.png'),
                      ),
                    ),
                  ),
                  sizedbox(0.0, width * 0.02),
                  Container(
                    height: height * 0.46,
                    width: width * 0.39,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade900,
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            AssetImage('assets/images/smart_door_unlock.png'),
                      ),
                    ),
                  ),
                ],
              ),
              sizedbox(height * 0.3, width),
              Container(
                height: height * 0.7,
                width: width * 0.5,
                padding: EdgeInsets.only(bottom: height * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/loyalty.png'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Your own Loyality Program',
                      style: largeHeadings,
                    ),
                    sizedbox(height * 0.005, 0.0),
                    SizedBox(
                      width: width * 0.4,
                      child: Text(
                        'Discover Coins and earn digital and physical rewards.'
                        ' Invite friends to collect Coins collectibles and increase your rewards.',
                        style: smallTextstylewhite,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              sizedbox(height * 0.03, width),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            minimumSize: Size(width * 0.2, height * 0.07),
                            backgroundColor: index == 0
                                ? Colors.purpleAccent
                                : Colors.white),
                        onPressed: () {},
                        child: Text(
                          index == 0 ? 'Invite Friends' : 'Join Program',
                          style: smallTextStyle,
                        ),
                      ),
                    );
                  },
                ),
              ),
              sizedbox(height * 0.3, width),
              SizedBox(
                height: height * 0.65,
                width: width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Innovative', style: largeHeadings),
                        Text(
                          'Booking App',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 54,
                              fontWeight: FontWeight.w400),
                        ),
                        Text('Change The way you Travel',
                            style: mediumtextstyle),
                        sizedbox(height * 0.08, 0.0),
                        Row(
                          children: List.generate(
                            2,
                            (index) => InkWell(
                              onTap: () {},
                              child: Container(
                                height: height * 0.08,
                                width: width * 0.12,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.008),
                                margin: EdgeInsets.only(right: width * 0.01),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 163, 238, 255),
                                      Color.fromARGB(255, 252, 215, 249),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.06,
                                      width: width * 0.028,
                                      child: Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(index == 0
                                            ? 'assets/images/googlePlayStore.png'
                                            : 'assets/images/appleStore.png'),
                                      ),
                                    ),
                                    sizedbox(width * 0.02, 0.0),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'GET IT ON',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Google Play',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: height * 0.45,
                      width: width * 0.23,
                      margin: EdgeInsets.only(right: width * 0.01),
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.4,
                        horizontal: width * 0.08,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/QrCode.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              sizedbox(height * 0.25, width),
              Text(
                'Choose Your Next\nDestination',
                style: largeHeadings,
                textAlign: TextAlign.center,
              ),
              sizedbox(height * 0.04, width),
              chooseYourDestinationsCountries(width, height),
              sizedbox(height * 0.3, width),
              aboutUsContainer(width, height),
            ],
          ),
        ),
      ),
    );
  }

  Padding chooseYourDestinationsCountries(double width, double height) {
    List images = [
      'assets/images/Dubai.png',
      'assets/images/germany.png',
      'assets/images/uk.jpeg',
      'assets/images/thailand.png',
      'assets/images/paris.png',
    ];
    List<String> destinations = [
      'Dubai',
      'Germany',
      'United Kingdom',
      'Thailand',
      'Paris',
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          5,
          (index) => Column(
            children: [
              ClipOval(
                child: Container(
                  height: height * 0.53,
                  width: width * 0.16,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(images[index]),
                    ),
                  ),
                ),
              ),
              sizedbox(height * 0.02, 0.0),
              Text(destinations[index], style: smallTextstylewhite),
            ],
          ),
        ),
      ),
    );
  }

  Container aboutUsContainer(double width, double height) {
    List policiesList = [
      'About us',
      'Contacts',
      'Faq',
      'User Agreement',
      'Privacy policy',
      'Coockies Policy',
    ];
    return Container(
      width: width,
      height: height * 0.38,
      margin: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tuchtrip', style: heading),
              sizedbox(height * 0.05, 0.0),
              Row(
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: width * 0.03),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        policiesList[index],
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: height * 0.017),
                      ),
                    ),
                  ),
                ),
              ),
              sizedbox(height * 0.05, 0.0),
              Text(
                  '© 2024 ONLINE Booking And Checking SOLUTIONS - FZCO. All rights reserved.',
                  style: smallTextstylewhite),
              sizedbox(height * 0.015, 0.0),
              SizedBox(
                width: width * 0.45,
                child: Text(
                  'The contents of this website are protected by copyright.'
                  'No part of this website may be copied, used, distributed, or modified without permission.'
                  'Touchtrip is not responsible for the content of any external websites.',
                  style: GoogleFonts.poppins(color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
          Container(
            height: height * 0.14,
            width: width * 0.12,
            margin: EdgeInsets.only(top: height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) {
                  List<String> socialMedia = [
                    'assets/images/Instagram_Icon.png',
                    'assets/images/Fb_Icon.png',
                    'assets/images/LinkedIn_Icon.png',
                  ];
                  return CircleAvatar(
                    radius: height * 0.03,
                    backgroundColor: Colors.grey.shade900,
                    child: Padding(
                      padding: EdgeInsets.all(height * 0.01),
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(socialMedia[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ======================================================== Search Bar ==========================================================
class SearchingBar extends StatefulWidget {
  final double height;
  final double width;
  const SearchingBar({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<SearchingBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchingBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.75,
      height: locationSearchingList || calendarPicker || roomsCounter
          ? widget.height * 0.6
          : widget.height * 0.08,
      padding: EdgeInsets.symmetric(horizontal: widget.width * 0.005),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: widget.height * 0.065,
                width: widget.width * 0.65,
                padding: EdgeInsets.only(left: widget.width * 0.005),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 163, 238, 255),
                      Color.fromARGB(255, 252, 215, 249),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    //===================================================== Location searcher =====================================================
                    Container(
                      width: widget.width * 0.23,
                      child: Consumer<FeaturesProvider>(
                        builder: (context, feature, child) => TextField(
                          onTap: () {
                            setState(() {
                              locationSearchingList = !locationSearchingList;
                              calendarPicker = false;
                              roomsCounter = false;
                            });
                          },
                          onChanged: (value) => feature.searchLocations(value),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:'Where would you like to go?',
                            hintStyle: smallTextStyle,
                            contentPadding:EdgeInsets.only(left: widget.width * 0.01),

                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(),
                    //===================================================== Calendar for Date picking =====================================================
                    InkWell(
                      onTap: () {
                        setState(() {
                          calendarPicker = !calendarPicker;
                          locationSearchingList = false;
                          roomsCounter = false;
                        });
                      },
                      child: Container(
                        height: widget.height * 0.5,
                        width: widget.width * 0.2,
                        padding: EdgeInsets.only(left: widget.width * 0.01),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Consumer<FeaturesProvider>(
                            builder: (context, calendar, child) => Text(
                                calendar.checkingDate != '' &&
                                        calendar.checkoutDate != ''
                                    ? '${calendar.checkingDate} - ${calendar.checkoutDate}'
                                    : 'Choose Your Date',
                                style: smallTextStyle),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          roomsCounter = !roomsCounter;
                          locationSearchingList = false;
                          calendarPicker = false;
                        });
                      },
                      child: Container(
                        height: widget.height * 0.5,
                        width: widget.width * 0.18,
                        padding: EdgeInsets.only(left: widget.width * 0.01),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Consumer<FeaturesProvider>(
                            builder: (context, searchbar, child) =>
                                Text(
                              '${searchbar.rooms} Rooms, ${searchbar.adults} Adults, ${searchbar.children} children',
                              style: smallTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedbox(0.0, widget.width * 0.01),
              Consumer<FeaturesProvider>(
                builder: (context, searchbar, child) => 
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    // if (searchbar.locationText == '' && searchbar.checkingDate != ''&& searchbar.checkoutDate != '') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPageDeskTop(),));
                    // }
                    // else{
                      // implement toast message
                    // }
                  },
                  child: Container(
                    height: widget.height * 0.065,
                    width: widget.width * 0.075,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 125, 217, 248),
                          Color.fromARGB(255, 28, 198, 255),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Search',
                        style: smallTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          sizedbox(widget.height * 0.005, 0.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sizedbox(0.0, widget.width * 0.004),
              locationSearchingList
                  ? Container(
                      height: widget.height * 0.5,
                      width: widget.width * 0.25,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      //=================================================================================================================================
                      child: Consumer<FeaturesProvider>(
                        builder: (context, locationProvider, child) =>
                            ListView.builder(
                          itemCount: locationProvider.searchResults.length,
                          padding: EdgeInsets.symmetric(
                            horizontal: widget.width * 0.00,
                            vertical: widget.height * 0.005,
                          ),
                          itemBuilder: (context, index) {
                            final location =
                                locationProvider.searchResults[index];
                            return TextButton(
                              style: TextButton.styleFrom(
                                overlayColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              onPressed: () {
                                location.setLocationText(location['display_name']);
                                Navigator.pop(context);
                              },
                              child: ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text(location['display_name']),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  //=======================================================================================================================================
                  : SizedBox(width: widget.width * 0.24),
              calendarPicker
                  ? CalendarDatePicker(
                      height: widget.height,
                      width: widget.width,
                    )
                  : SizedBox(width: widget.width * 0.205),
              roomsCounter
                  ? RoomsCountDropDownSheet(
                      height: widget.height,
                      width: widget.width,
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class CalendarDatePicker extends StatefulWidget {
  final double height;
  final double width;
  const CalendarDatePicker({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<CalendarDatePicker> createState() => _CalendarDatePickerState();
}

class _CalendarDatePickerState extends State<CalendarDatePicker> {
  @override
  Widget build(BuildContext context) {
    final config = CalendarDatePicker2Config(
      centerAlignModePicker: true,
      calendarType: CalendarDatePicker2Type.range,
      calendarViewMode: CalendarDatePicker2Mode.scroll,
      rangeBidirectional: true,
      selectedDayHighlightColor: Color.fromARGB(255, 0, 238, 210),
      dayBorderRadius: BorderRadius.circular(10),
      firstDate: DateTime.now(),
      currentDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      disabledDayTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
      hideScrollViewTopHeader: false,
      dayTextStyle: TextStyle(color: Colors.black),
      selectableYearPredicate: (year) => true,
      selectableDayPredicate: (day) => true,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 1,
        fontWeight: FontWeight.bold,
      ),
    );
    return Container(
      height: widget.height * 0.5,
      width: widget.width * 0.28,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Consumer<FeaturesProvider>(
          builder: (context, value, child) => CalendarDatePicker2(
            config: config,
            value: value.rangeDatePickerValueWithDefaultValue,
            onValueChanged: (dates) {
              value.setSelectDates(dates);
            },
          ),
        ),
      ),
    );
  }
}

//==================================== How Many Guests are Booking and they need How many Roooms ====================================================
//===================================================================================================================================================
//================================================= Rooms Guest and childrens count =================================================================
//===================================================================================================================================================
//===================================================================================================================================================
class RoomsCountDropDownSheet extends StatelessWidget {
  final double height;
  final double width;
  const RoomsCountDropDownSheet({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final bottomSheet = Provider.of<FeaturesProvider>(context);
    return Container(
      height: height * 0.5,
      width: width * 0.2,
      padding: EdgeInsets.symmetric(horizontal: width * 0.00),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<FeaturesProvider>(
                builder: (context, bottomsheet, child) =>
                    _buildDropdown('Rooms', bottomsheet.rooms, (value) {
                  bottomsheet.setRoomCount(value);
                }),
              ),
              Consumer<FeaturesProvider>(
                builder: (context, bottomSheet, child) =>
                    _buildDropdown('Adults', bottomSheet.adults, (value) {
                  bottomSheet.setAdultsCount(value);
                }),
              ),
              Consumer<FeaturesProvider>(
                builder: (context, bottomSheet, child) =>
                    _buildDropdown('Children', bottomSheet.children, (value) {
                  bottomSheet.setChildrenCount(value);
                }),
              ),
              sizedbox(height * 0.02, 0.0),
              if (bottomSheet.children > 0) ..._buildChildrenAges(context),
              sizedbox(height * 0.02, 0.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, int value, ValueChanged onChanged) {
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
    final bottomSheet = Provider.of<FeaturesProvider>(context, listen: false);
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
                child: Consumer<FeaturesProvider>(
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


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final double width;

  const CustomAppBar({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
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
          onPressed: () {},
          icon: const Icon(IconlyLight.chat),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconlyLight.profile,
            size: height * 0.035,
            color: Colors.black,
          ),
        ),
        SizedBox(width: width * 0.01),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}