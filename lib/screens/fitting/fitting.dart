import 'dart:developer';

import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/fitting/booking_calendar.dart';
import 'package:unearthed/shared/styled_text.dart';


class Fitting extends StatefulWidget {
  const Fitting({super.key});

  @override
  State<Fitting> createState() => _FittingState();
}

class _FittingState extends State<Fitting> {
  // BC
  final now = DateTime.now();
  late BookingService mockBookingService;

  List<String> allNames = [];
  late DateTime? pickedDate = DateTime.now();

  @override
  void initState() {
     super.initState();
     for (Item i in allItems) {
      allNames.add(i.name);
     }
         // BC
         mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 60,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  // BC
  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    // await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    log('${newBooking.toJson()} has been uploaded');
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
    ///disabledDays will properly work with real data
    DateTime first = now;
    DateTime tomorrow = now.add(const Duration(days: 1));
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(DateTimeRange(start: first, end: now.add(const Duration(minutes: 60))));
    converted.add(DateTimeRange(start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(start: fourth, end: fourth.add(const Duration(minutes: 50))));

    //book whole day example
    converted.add(DateTimeRange(
        start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0),
        end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 0)));
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  void removeItemName(String name) {
    allNames.remove(name);
  }

  // List<String> getItemNames() {
  //    for (Item i in allItems) {
  //     allNames.add(i.name);
  //    }
  //   log('allNames size: ${allNames.length}');
  //   return allNames;
  // }

  Map chosenItem = {};
  List<Map> chosenItems = [];
  
  Color containerColour = Colors.white;
  bool isSelected = false;

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List newChosenItems = List.from(chosenItems);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.2,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle('BOOK A FITTING'),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: width*0.08),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, width * 0.01, 0),
                child: Icon(Icons.close, size: width*0.06),
              )),
        ],
      ),
  body: Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: chosenItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = !isSelected;
                              chosenItems[index]['selected'] = isSelected;
                            });
                          },
                          child: Container(
                          height: 50,
                          color: (chosenItems[index]['selected'] == true) ? Colors.green : Colors.white,
                          child: Center(child: Text(chosenItems[index]['name'])),
                          ),
                        );
                      }
                                ),
                  ),
                              const SizedBox(height: 20),
                              if (chosenItems.isNotEmpty) ElevatedButton(
                                onPressed: () {
                                  for (Map i in newChosenItems) {
                                    if (i['selected'] == true) {
                                      chosenItems.remove(i);
                                    }
                                  }
                                  setState(() {
                                  });
                                }, 
                                child: const Text('REMOVE'),
                                ),
      //                         if (chosenItems.isNotEmpty) ElevatedButton(
      //                           onPressed: () async {
      //                             pickedDate = await showDatePicker(
      //                         currentDate: DateTime.utc(1989, 11, 9),
      //                         builder: (context, child) {
      //   return Theme(
      //     data: Theme.of(context).copyWith(
      //       // TODO: Not working to change texttheme to increase fontsize
      //       textTheme: const TextTheme(
      //         // headlineSmall: TextStyle(fontSize: 20),
      //         // headlineMedium: TextStyle(fontSize: 20),
      //         // headlineLarge: TextStyle(fontSize: 20),
      //         // labelSmall: TextStyle(fontSize: 40),
      //         // labelMedium: TextStyle(fontSize: 40),
      //         labelLarge: TextStyle(fontSize: 20),
      //         // displaySmall: TextStyle(fontSize: 80),
      //         // displayMedium: TextStyle(fontSize: 80),
      //         // displayLarge: TextStyle(fontSize: 80),
      //         titleSmall: TextStyle(fontSize: 20),
      //         // titleMedium: TextStyle(fontSize: 80),
      //         // titleLarge: TextStyle(fontSize: 80),
      //         // bodySmall: TextStyle(fontSize: 80),
      //         // bodyMedium: TextStyle(fontSize: 80),
      //         // bodyLarge: TextStyle(fontSize: 80),
      //       ),
      //       colorScheme: const ColorScheme.light(
      //         primary: Colors.black, // header background color
      //         onPrimary: Colors.white, // header text color
      //         onSurface: Colors.black, // body text color
      //       ),
      //       textButtonTheme: TextButtonThemeData(
      //         style: OutlinedButton.styleFrom(
      //                   foregroundColor: Colors.white,
      //                   backgroundColor: Colors.black,
      //                   shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(30.0),
      //                 ),
      //                 side: const BorderSide(width: 1.0, color: Colors.white),
      //                 ),
      //       ),
      //     ),
      //     child: child!,
      //   );
      // },
      //                   helpText: 'SELECT START DATE',
      //                   context: context,
      //                   // initialDate: DateTime.now(),
      //                   // initialDate: DateTime(2024, 8, 25),
      //                   // initialDate: DateTime.now().add(const Duration(days: -100)),
      //                   // firstDate: DateTime.now().add(const Duration(days: -1)),
      //                   firstDate: DateTime.now(),
      //                   lastDate: DateTime.now().add(const Duration(days: 60)),
      //                   // selectableDayPredicate: (DateTime day) =>
      //                       // !getBlackoutDates(
      //                               // widget.item.id, noOfDays)
      //                           // .contains(day),
      //                   // day.isAfter(DateTime.now()),
      //                 );
      //                 setState(() {
                        
      //                 });
      //                           }, 
      //                           child: const Text('SELECT DATE'),
      //                           )
                ],
              ),
            ),
          ),
        ],
      ),
                  const SizedBox(height: 100),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const BookingCalendarDemoApp())));
                    },
                    child: Row(
                      children: [
                        const Text('Appointment Date: '),
                        Text(pickedDate.toString()),
                      ],
                    ),
                  ),
if (chosenItems.isNotEmpty) Center(
            child: SizedBox(
              height: 600,
              child: BookingCalendar(
                bookingService: mockBookingService,
                convertStreamResultToDateTimeRanges: convertStreamResultMock,
                getBookingStream: getBookingStreamMock,
                uploadBooking: uploadBookingMock,
                // pauseSlots: generatePauseSlots(),
                pauseSlots: const [],
                pauseSlotText: 'LUNCH',
                
                hideBreakTime: true,
                loadingWidget: const Text('Fetching data...'),
                uploadingWidget: const CircularProgressIndicator(),
                // locale: 'hu_HU',
                startingDayOfWeek: StartingDayOfWeek.tuesday,
                wholeDayIsBookedWidget:
                    const Text('Sorry, for this day everything is booked'),
                //disabledDates: [DateTime(2023, 1, 20)],
                //disabledDays: [6, 7],
                bookingGridCrossAxisCount: 6,
              ),
            ),
          ), 

                  
    ],
  ),
  bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ],
        ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                if (pickedDate != null) Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                    },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      side: const BorderSide(width: 1.0, color: Colors.black),
                      ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: StyledHeading('CONTINUE', weight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                if (pickedDate == null) Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      log('MOVING ON');
                      // ready = false;
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                      side: const BorderSide(width: 1.0, color: Colors.black),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: StyledHeading('CONTINUE', color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),   
    );
  }
}