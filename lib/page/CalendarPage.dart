import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class CalendarPage extends StatefulWidget {

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  bool _isLogedIn = true;
  var calendarController;

  @override
  void initState() {
    // TODO: implement initState
    calendarController = CleanCalendarController(
      initialDateSelected: DateTime.now(),
      minDate: DateTime.now().subtract(const Duration(days: 90)),
      maxDate: DateTime.now().add(const Duration(days: 90)),
      rangeMode: false,
      onDayTapped: (date) {
        print(date);
      },
      onPreviousMinDateTapped: (date) {},
      onAfterMaxDateTapped: (date) {},
      weekdayStart: DateTime.monday,
      // endDateSelected: DateTime(2022, 2, 3),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _isLogedIn == false
              ? Container(
            height: 60,
            width: 120,
            margin: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/Login'),
              child: const Text('Login'),
            ),
          )
              : Container(
            margin: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                const Text(
                  'Rawad Zogheib',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () =>
                      Scaffold.of(context).openEndDrawer(),
                  child: CircleAvatar(
                    backgroundColor: HexColor('#222222'),
                    backgroundImage: const AssetImage(
                        'Assets/HomePage/ProfilePicture/img1.png'),
                    maxRadius: 35,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 600,
            width: 600,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                color: globals.whiteBlue,
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: ScrollableCleanCalendar(
                    calendarController: calendarController,
                    layout: Layout.DEFAULT,
                    calendarCrossAxisSpacing: 4,
                    scrollController: ScrollController(
                      initialScrollOffset: MediaQuery
                          .of(context)
                          .size
                          .height * 1.4,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
