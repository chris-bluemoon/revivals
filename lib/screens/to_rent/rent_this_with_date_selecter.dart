import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/to_rent/confirm_rent.dart';
import 'package:unearthed/screens/to_rent/rent_this_next_bar.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/globals.dart' as globals;

var uuid = const Uuid();


class RentThisWithDateSelecter extends StatefulWidget {
  RentThisWithDateSelecter(this.item, {super.key});
  
  final Item item;

  @override
  State<RentThisWithDateSelecter> createState() => _RentThisWithDateSelecterState();
}

class _RentThisWithDateSelecterState extends State<RentThisWithDateSelecter> {
  DateTime? startDate;
  DateTime? endDate;
  late int noOfDays = 0;
  late int totalPrice = 0;
  bool bothDatesSelected = false;
  bool showConfirm = false;

  // void handleSubmit(String renterId, String itemId, String startDate, String endDate, int price) {
  //   Provider.of<ItemStore>(context, listen: false).addItemRenter(ItemRenter(
  //     id: uuid.v4(),
  //     renterId: renterId,
  //     itemId: itemId,
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
        noOfDays = endDate!.difference(startDate!).inDays;
        totalPrice = noOfDays * widget.item.rentPrice;
        log(noOfDays.toString());
      });
    } else {
      setState(() {
        bothDatesSelected = false;
        showConfirm = false;
      });
    }
  }

  List<DateTime> getBlackoutDates(String itemId) {

    log(itemId);
    List<ItemRenter> itemRenters =Provider.of<ItemStore>(context, listen: false)
      .itemRenters;
    List<DateTime> tempList = [];

    for (int i = 0; i<itemRenters.length; i++) {
      DateTime startDate = DateFormat("yyyy-MM-dd").parse(itemRenters[i].startDate);
      DateTime endDate = DateFormat("yyyy-MM-dd").parse(itemRenters[i].endDate);
      String itemIdDB = itemRenters[i].itemId;
      if (itemIdDB == itemId) {
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
            // StyledTitle(widget.item.name.toUpperCase()),
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
            height: 550,
            child: SfDateRangePicker(
              // minDate: DateTime(2024, 7, 5),
              monthViewSettings: DateRangePickerMonthViewSettings(blackoutDates:getBlackoutDates(widget.item.id)),
              enablePastDates: false,
              navigationDirection: DateRangePickerNavigationDirection.vertical,
              backgroundColor: Colors.white,
              selectionColor: Colors.black,
              headerStyle: const DateRangePickerHeaderStyle(
                backgroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                )),
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
                headerHeight: 60,
            ),
          ),

        const Expanded(child: SizedBox()),
        const Divider(height: 1, color: Colors.black),
      if (showConfirm) 
        Expanded(child: RentThisNextBar(widget.item, noOfDays, startDate!, endDate!)),
        ],
      ),

    );
  }
}