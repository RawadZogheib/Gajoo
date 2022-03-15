import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class MyCustomCalender extends StatelessWidget {
  Set<String> greenList;
  Set<String> redList;
  var onDayPressed;

  MyCustomCalender(
      {required this.greenList,
      required this.redList,
      required this.onDayPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35.0, 8.0, 35.0, 8.0),
      decoration: const BoxDecoration(
        color: Colors.white, //HexColor('#fafafa'),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        //border: Border.all(width: 1),
      ),
      child: PagedVerticalCalendar(
        startDate: DateTime.now().toLocal().subtract(const Duration(days: 60)),
        onDayPressed: (date) => onDayPressed(date),
        scrollController: ScrollController(),
        /// customize the month header look by adding a week indicator
        monthBuilder: (context, month, year) {
          return Column(
            children: [
              /// create a customized header displaying the month and year
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                margin: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Text(
                  DateFormat('MMMM yyyy').format(DateTime(year, month)),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),

              /// add a row showing the weekdays
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    weekText('Mo'),
                    weekText('Tu'),
                    weekText('We'),
                    weekText('Th'),
                    weekText('Fr'),
                    weekText('Sa'),
                    weekText('Su'),
                  ],
                ),
              ),
            ],
          );
        },

        /// added a line between every week
        dayBuilder: (context, date) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              date.isBefore(DateTime.parse(DateFormat('yyyy-MM-dd')
                      .format(DateTime.now().toLocal())))
                  ? Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: HexColor('#dfe2e6'),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(4.0),
                          child: StrikeThroughWidget2(
                            child: Text(
                              DateFormat('d').format(date),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
                    )
                  : greenList.contains(DateFormat('yyyy-MM-dd').format(date))
                      ? Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              border: date.isAtSameMomentAs(DateTime.parse(
                                      DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now().toLocal())))
                                  ? Border.all(width: 2, color: Colors.green)
                                  : null,
                            ),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(4.0),
                            child: Text(
                              DateFormat('d').format(date),
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : redList.contains(DateFormat('yyyy-MM-dd').format(date))
                          ? Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  border: date.isAtSameMomentAs(DateTime.parse(
                                          DateFormat('yyyy-MM-dd').format(
                                              DateTime.now().toLocal())))
                                      ? Border.all(width: 2, color: Colors.red)
                                      : null,
                                ),
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(4.0),
                                child: Text(
                                  DateFormat('d').format(date),
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: globals
                                        .whiteBlue, //HexColor('#dfe2e6'),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    border: date.isAtSameMomentAs(
                                            DateTime.parse(
                                                DateFormat('yyyy-MM-dd').format(
                                                    DateTime.now().toLocal())))
                                        ? Border.all(
                                            width: 2, color: Colors.black)
                                        : null,
                                  ),
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(4.0),
                                  child: Text(
                                    DateFormat('d').format(date),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
              // const Divider(),
            ],
          );
        },
      ),
    );
  }

  Widget weekText(String text) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class StrikeThroughWidget extends StatelessWidget {
  final Widget _child;

  StrikeThroughWidget({Key? key, required Widget child})
      : this._child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _child,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      // this line is optional to make strikethrough effect outside a text
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('Assets/HomePage/graphics/strikethrough2.png',),
            fit: BoxFit.fitWidth),
      ),
    );
  }
}

class StrikeThroughWidget2 extends StatelessWidget {
  final Widget _child;

  StrikeThroughWidget2({Key? key, required Widget child})
      : this._child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: _child),
        //Center(child: Image.asset('Assets/HomePage/graphics/strikethrough2.png',width: 40,)),
        Center(child: Container(height: 1,width: 25,color: Colors.black,),)
      ],
    );
  }
}