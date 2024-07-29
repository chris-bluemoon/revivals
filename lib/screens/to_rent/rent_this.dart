import 'dart:developer';

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
            child: SfDateRangePicker(
              // maxDate: DateTime(2024, 8, 1),
              // enableMultiView: true,
              navigationDirection: DateRangePickerNavigationDirection.vertical,
              backgroundColor: Colors.white,
              selectionColor: Colors.black,
              headerStyle: DateRangePickerHeaderStyle(backgroundColor: Colors.white),
              onSelectionChanged: _onSelectionChanged,
              // selectionTextStyle: const TextStyle(backgroundColor: Colors.blue),
              selectionMode: DateRangePickerSelectionMode.range,
              
              // rangeSelectionColor: Colors.green,
            ),
          ),
          if (showConfirm) ElevatedButton(
            child: ConfirmRentWidget(widget.dress),
            onPressed: () {
                String email = Provider.of<DressStore>(context, listen: false).renters[0].email;
                // log('Selected start date of: $startDate');
                // handleSubmit(email, widget.dress.id, '${startDate}', '${startDate}', 0);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (Summary(email, widget.dress, '${startDate}', '${endDate}' ))));
            },
          ),
        ],
      ),
    );
  }
}