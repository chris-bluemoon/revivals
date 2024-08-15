import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';
import 'package:unearthed/screens/summary/summary_rental.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class RentThisWithDateSelecter extends StatefulWidget {
  const RentThisWithDateSelecter(this.item, this.rentalDays, {super.key});

  final Item item;
  final int rentalDays;

  @override
  State<RentThisWithDateSelecter> createState() =>
      _RentThisWithDateSelecterState();
}

class _RentThisWithDateSelecterState extends State<RentThisWithDateSelecter> {
  DateTime? startDate;
  DateTime? endDate;
  late int noOfDays = 0;
  // late int totalPrice = 0;
  bool bothDatesSelected = false;
  bool showConfirm = false;

  int totalPrice(int noOfDays) {
    int oneDayPrice = widget.item.rentPrice;

    if (noOfDays == 3) {
      int threeDayPrice = ((3 * oneDayPrice) * 0.8).toInt()-1;
      return (threeDayPrice ~/ 100) * 100 + 100;
    }
    if (noOfDays == 5) {
      int fiveDayPrice = ((5 * oneDayPrice) * 0.6).toInt()-1;
      return (fiveDayPrice ~/ 100) * 100 + 100;
    }
    return oneDayPrice;
  }

  List<DateTime> getBlackoutDates(String itemId, int daysToRent) {
    // log(itemId);
    List<ItemRenter> itemRenters =
        Provider.of<ItemStore>(context, listen: false).itemRenters;
    List<DateTime> tempList = [];

    for (int i = 0; i < itemRenters.length; i++) {
      
      DateTime startDate =
          DateFormat("yyyy-MM-dd").parse(itemRenters[i].startDate);
      DateTime endDate = DateFormat("yyyy-MM-dd").parse(itemRenters[i].endDate);
      String itemIdDB = itemRenters[i].itemId;
      if (itemIdDB == itemId) {
        for (int y = 0;
            y <=
                endDate
                    .difference(startDate.subtract(Duration(days: daysToRent)))
                    .inDays;
            y++) {
          tempList.add(startDate
              .subtract(Duration(days: daysToRent))
              .add(Duration(days: y)));
        }
      }
    }

    // DateTime formattedDate = DateFormat("yyyy-MM-dd").parse(rDate);
    // log(formattedDate.toString());
    // return DateFormat("yyyy-MM-dd").parse(rDate);
    // return [DateFormat("yyyy-MM-dd").parse('2024-07-31')];
    if (tempList.isEmpty) {
      log('tempList is empty');
    }
    return tempList;
    // return rDate;
  }

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2024, 8, 1),
    end: DateTime(2024, 9, 30),
  );

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }

  DateRange selectedDateRange = DateRange(DateTime.now(), DateTime.now());

  int selectedOption = -1;
  @override
  Widget build(BuildContext context) {
    // rebuildAllChildren(context);
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // StyledTitle(widget.item.name.toUpperCase()),
            StyledTitle('Select No of Days'),
            // Image.asset(
            //   'assets/logos/unearthed_logo_2.png',
            //   fit: BoxFit.contain,
            //   height: 200,
            // ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: const Icon(Icons.close)),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.grey[300],
              height: 1.0,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // const Text('RENTAL TERM', style: TextStyle(fontSize: 12)),
          const SizedBox(height: 30),
          ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -3),
              title: const Text('1 Day', style: TextStyle(fontSize: 14)),
              trailing: Radio<int>(
                  value: 0,
                  groupValue: selectedOption,
                  // fillColor: Colors.black,
                  onChanged: (value) async {
                                        setState(() {
                      selectedOption = value!;
                    });
                    noOfDays = 1;
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      // initialDate: DateTime.now(),
                      // initialDate: DateTime(2024, 8, 25),
                      // initialDate: DateTime.now().add(const Duration(days: -100)),
                      // firstDate: DateTime.now().add(const Duration(days: -1)),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 60)),
                      selectableDayPredicate: (DateTime day) =>
                          !getBlackoutDates(
                                  widget.item.id, noOfDays)
                              .contains(day),
                      // day.isAfter(DateTime.now()),
                    );



                    if (pickedDate != null) {
                      setState(() {
                        startDate = pickedDate;
                        endDate = pickedDate
                            .add(Duration(days: noOfDays));
                        log("Button value: $pickedDate");
                        log('state of showConfirm: $showConfirm');
                        log(startDate.toString());
                        log(endDate.toString());
                        log(noOfDays.toString());
                        showConfirm = true;
                        // bool loggedIn = Provider.of<ItemStore>(context, listen: false).loggedIn;
                        // loggedIn ? Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) => (SummaryRental(widget.item, startDate!, endDate!, noOfDays, totalPrice(noOfDays)))
                        // )) : Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const GoogleSignInScreen())));

                      });
                    }
                  })),
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -3),
            title: const Text('3 Days', style: TextStyle(fontSize: 14)),
            trailing: Radio<int>(
              value: 1,
              groupValue: selectedOption,
              onChanged: (value2) async {
                setState(() {
                  selectedOption = value2!;
                });
                noOfDays = 3;
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  // initialDate: DateTime.now(),
                  // initialDate: DateTime(2024, 8, 25),
                  // initialDate: DateTime.now().add(const Duration(days: -100)),
                  // firstDate: DateTime.now().add(const Duration(days: -1)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 60)),
                  selectableDayPredicate: (DateTime day) => !getBlackoutDates(
                          widget.item.id, noOfDays)
                      .contains(day),
                  // day.isAfter(DateTime.now()),
                );


                if (pickedDate != null) {
                  setState(() {
                    selectedOption = value2!;
                    startDate = pickedDate;
                    endDate = pickedDate
                        .add(Duration(days: noOfDays));
                    log("Button value: $pickedDate");
                    log('state of showConfirm: $showConfirm');
                    log(startDate.toString());
                    log(endDate.toString());
                    log(noOfDays.toString());
                    showConfirm = true;
                                           bool loggedIn = Provider.of<ItemStore>(context, listen: false).loggedIn;
                        loggedIn ? Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => (SummaryRental(widget.item, startDate!, endDate!, noOfDays, totalPrice(noOfDays)))
                        )) : Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const GoogleSignInScreen())));
                  });
                }
              },
            ),
          ),
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -3),
            title: const Text('5 Days', style: TextStyle(fontSize: 14)),
            trailing: Radio<int>(
              value: 2,
              groupValue: selectedOption,
              onChanged: (value3) async {
                setState(() {
                  selectedOption = value3!;
                });
                noOfDays = 5;
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  // initialDate: DateTime.now(),
                  // initialDate: DateTime(2024, 8, 25),
                  // initialDate: DateTime.now().add(const Duration(days: -100)),
                  // firstDate: DateTime.now().add(const Duration(days: -1)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 60)),
                  selectableDayPredicate: (DateTime day) => !getBlackoutDates(
                          widget.item.id, noOfDays)
                      .contains(day),
                  // day.isAfter(DateTime.now()),
                );


                if (pickedDate != null) {
                  setState(() {
                    startDate = pickedDate;
                    endDate = pickedDate
                        .add(Duration(days: noOfDays));
                    log("Button value: $pickedDate");
                    log('state of showConfirm: $showConfirm');
                    log(startDate.toString());
                    log(endDate.toString());
                    log(noOfDays.toString());
                    showConfirm = true;
                        bool loggedIn = Provider.of<ItemStore>(context, listen: false).loggedIn;
                        loggedIn ? Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => (SummaryRental(widget.item, startDate!, endDate!, noOfDays, totalPrice(noOfDays)))
                        )) : Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const GoogleSignInScreen())));
                  });
                }
                // if (pickedDate == null) {
                //   return;
                // } else {
                //  setState(() {
                //   newDate = pickedDate;
                //   log("2nd Button value: $pickedDate");
                //  });
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}
