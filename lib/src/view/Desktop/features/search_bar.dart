
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/toest_message.dart';
import 'package:tuch/src/view/Desktop/Search/searchPage.dart';
import 'package:tuch/src/view/Desktop/features/rooms_guest_counter.dart';
import 'package:tuch/utils/textstyles.dart';

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
    return Consumer<FeaturesProvider>(
      builder: (context, sheets, child) => Container(
        width: widget.width * 0.75,
        height: sheets.isLocationSearchSheetOn ||
                sheets.isCalendarPickerSheetOn ||
                sheets.isRoomsCounterSheetOn
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
                        Color.fromARGB(255, 105, 227, 255),
                        Color.fromARGB(255, 255, 167, 248),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      //===================================================== Location searcher =====================================================
                      buildLocationTextfield(),
                      //==================================================================================================================================
                      const VerticalDivider(),
                      //===================================================== Calendar for Date picking =====================================================
                      buildDatePickerTextField(),
                      //==================================================================================================================================
                      //===================================================== Guests Rooms Counter ==========================================================
                      buildGuestsandRoomsCounter(),
                      //==================================================================================================================================
                    ],
                  ),
                ),
                sizedbox(0.0, widget.width * 0.01),
                //========================================================== Search Button ==============================================================
                buildSearchButton(),
                //==================================================================================================================================
              ],
            ),
            sizedbox(widget.height * 0.005, 0.0),
            Consumer<FeaturesProvider>(
              builder: (context, sheets, child) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  sizedbox(0.0, widget.width * 0.004),
                  sheets.isLocationSearchSheetOn
                      ? buildLocationSearchSheet()
                      //=======================================================================================================================================
                      : SizedBox(width: widget.width * 0.24),
                  sheets.isCalendarPickerSheetOn
                      ? CalendarDatePicker(
                          height: widget.height,
                          width: widget.width,
                        )
                      : SizedBox(width: widget.width * 0.205),
                  sheets.isRoomsCounterSheetOn
                      ? RoomsCountDropDownSheet(
                          height: widget.height,
                          width: widget.width,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildLocationTextfield() {
    return SizedBox(
      width: widget.width * 0.23,
      child: Consumer<FeaturesProvider>(
        builder: (context, feature, child) => TextField(
          onTap: () {
            feature.getLocationSearchSheet();
          },
          controller: feature.locationController,
          onChanged: (value) {
            feature.searchLocations(value);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: feature.selectedLocation != ''
                ? feature.selectedLocation
                : 'Where would you like to go?',
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            hintStyle: smallTextStyle,
            contentPadding: EdgeInsets.only(
              left: widget.width * 0.01,
              bottom: widget.height * 0.02,
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildDatePickerTextField() {
    final feature = Provider.of<FeaturesProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        feature.getDatePickerSheet();
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
          child: Text(
            feature.checkingDate != '' && feature.checkoutDate != ''
                ? '${feature.checkingDate} - ${feature.checkoutDate}'
                : 'Choose Your Date',
            style: smallTextStyle,
          ),
        ),
      ),
    );
  }

  InkWell buildGuestsandRoomsCounter() {
    final feature = Provider.of<FeaturesProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        feature.getRoomsGuestCounterSheet();
      },
      child: Container(
        height: widget.height * 0.5,
        width: widget.width * 0.18,
        padding: EdgeInsets.only(left: widget.width * 0.01),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${feature.rooms} Rooms, ${feature.adults} Adults, ${feature.children} children',
            style: smallTextStyle,
          ),
        ),
      ),
    );
  }

  Widget buildSearchButton() {
    return Consumer<FeaturesProvider>(
      builder: (context, feature, child) => InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          if (feature.selectedLocation != '' &&
              feature.checkingDate != '' &&
              feature.checkoutDate != '') {
            feature.disposeAllSheets();
            Navigator.push(context,MaterialPageRoute(builder: (context) => const SearchPageDeskTop()));
            feature.gethNightCount();
          } else {
            toastmessege(
                'Please let us know your destination and travel dates, so we can arrange a suitable stay');
          }
        },
        child: Container(
          height: widget.height * 0.065,
          width: widget.width * 0.075,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 7, 234, 255),
                Color.fromARGB(255, 28, 213, 255),
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
    );
  }

  Container buildLocationSearchSheet() {
    final featureProvider = Provider.of<FeaturesProvider>(context, listen: false);
    return Container(
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
      child: ListView.builder(
        itemCount: featureProvider.searchResults.length,
        padding: EdgeInsets.symmetric(
          horizontal: widget.width * 0.00,
          vertical: widget.height * 0.005,
        ),
        itemBuilder: (context, index) {
          final location = featureProvider.searchResults[index];
          return TextButton(
            style: TextButton.styleFrom(
              overlayColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              featureProvider.disposeAllSheets();
              featureProvider.setLocationText(location['display_name']);
            },
            child: ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: Text(location['display_name']),
            ),
          );
        },
      ),
    );
  }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////// CALENDAR DATE PICKER  ///////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
