import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tuch/src/view%20model/calender_provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/utils/textstyles.dart';

class BookingCalendarPage extends StatelessWidget {
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leadingWidth: width * 0.18,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Select Dates',
          style: mediumTextStyleLight,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: height * 0.11,
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Consumer<CalendarProvider>(
          builder: (context, calendar, child) => InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 66, 230, 148),
                    Color.fromARGB(255, 59, 178, 184),
                  ],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Provider.of<CalendarProvider>(context, listen: false)
                                .selectedDates
                                .length >
                            1
                        ? Row(
                            children: [
                              Text(
                                '${calendar.checkingDate} - ${calendar.checkoutDate}',
                                style: whiteSmallTextStyle,
                              ),
                              sizedbox(0.0, width * 0.02),
                              Text(
                                "${calendar.selectedDates.length - 1}",
                                style: whiteSmallTextStyle,
                              ),
                              sizedbox(0.0, width * 0.02),
                              AppIcon(
                                iconData: Icons.nights_stay,
                                color: Colors.white,
                                height: height * 0.025,
                              ),
                            ],
                          )
                        : Text('Select', style: whiteSmallTextStyle),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
