import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/to_rent/confirm_rent.dart';
import 'package:unearthed/screens/summary/summary.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/models/dress_renter.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();


class RentThis extends StatefulWidget {
  RentThis(this.dress, {super.key});
  
  final Dress dress;

  @override
  State<RentThis> createState() => _RentThisState();
}

class _RentThisState extends State<RentThis> {
  DateTime? startDate;
  DateTime? endDate;
  bool bothDatesSelected = false;
  bool showConfirm = false;

  // void handleSubmit(String renterId, String dressId, String startDate, String endDate, int price) {
  //   Provider.of<DressStore>(context, listen: false).addDressRenter(DressRenter(
  //     id: uuid.v4(),
  //     renterId: renterId,
  //     dressId: dressId,
  //     startDate: startDate,
  //     endDate: endDate,
  //     price: 0,
  //   ));
  // }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
    startDate = args.value.startDate;
    endDate = args.value.endDate;
    if (endDate != null) {
      setState(() {
        bothDatesSelected = true;
        showConfirm = true;
      });
    } else {
      setState(() {
        bothDatesSelected = false;
        showConfirm = false;
      });
    }
  }

  List<DateTime> getBlackoutDates(String dressId) {

    log(dressId);
    List<DressRenter> renters =Provider.of<DressStore>(context, listen: false)
      .dressRenters;
    List<DateTime> tempList = [];

    for (int i = 0; i<renters.length; i++) {
      DateTime startDate = DateFormat("yyyy-MM-dd").parse(renters[i].startDate);
      DateTime endDate = DateFormat("yyyy-MM-dd").parse(renters[i].endDate);
      String dressIdDB = renters[i].dressId;
      if (dressIdDB == dressId) {
      for (int y = 0; y <= endDate.difference(startDate).inDays; y++) {
        tempList.add(startDate.add(Duration(days: y)));
      }
    }}

    // DateTime formattedDate = DateFormat("yyyy-MM-dd").parse(rDate);
    // log(formattedDate.toString());
    // return DateFormat("yyyy-MM-dd").parse(rDate);
    // return [DateFormat("yyyy-MM-dd").parse('2024-07-31')];
    return tempList;
    // return rDate;
  }

  @override
  Widget build(BuildContext context) {

    // List<DateTime> blackOutDates = getBlackoutDates('23232321321312');
    return Scaffold(
        appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // StyledTitle(widget.dress.name.toUpperCase()),
            StyledTitle('Select Dates'),
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
          )
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(1),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey,
            ),
            height: 400,
            child: SfDateRangePicker(
              // minDate: DateTime(2024, 7, 5),
              monthViewSettings: DateRangePickerMonthViewSettings(blackoutDates:getBlackoutDates(widget.dress.id)),
              enablePastDates: false,
              navigationDirection: DateRangePickerNavigationDirection.vertical,
              backgroundColor: Colors.white,
              selectionColor: Colors.black,
              headerStyle: DateRangePickerHeaderStyle(backgroundColor: Colors.white),
              onSelectionChanged: _onSelectionChanged,
              // selectionTextStyle: const TextStyle(backgroundColor: Colors.blue),
              selectionMode: DateRangePickerSelectionMode.range,
              monthCellStyle: const DateRangePickerMonthCellStyle(blackoutDateTextStyle:
                TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough),
                ),
                startRangeSelectionColor: Colors.black,
                endRangeSelectionColor: Colors.black,
                rangeSelectionColor: Colors.black.withOpacity(0.1),
                todayHighlightColor: Colors.grey,
                selectionShape: DateRangePickerSelectionShape.circle,
                enableMultiView: true,
                // headerHeight: 60,
                
              
              // rangeSelectionColor: Colors.green,
            ),
          ),
          if (showConfirm) ElevatedButton(
            child: ConfirmRentWidget(widget.dress),
            onPressed: () {
                String email = Provider.of<DressStore>(context, listen: false).renters[0].email;
                final f = DateFormat('yyyyMMdd');
                // String startDateText = DateFormat('Y m d').format(startDate!);
                String startDateText = f.format(startDate!);
                // handleSubmit(email, widget.dress.id, '${startDate}', '${startDate}', 0);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (Summary(email, widget.dress, '${startDate}', '${endDate}' ))));
            },
          ),
        ],
      ),
    );
  }
}