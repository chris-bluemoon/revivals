import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/models/dress.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class RentThis extends StatelessWidget {
  RentThis(this.dress, {super.key});
  
  final Dress dress;

  String startDate = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
    log(args.value.toString());
    startDate = args.value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle(dress.name.toUpperCase()),
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
              icon: const Icon(Icons.share)),
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
              backgroundColor: Colors.white,
              selectionColor: Colors.black,
              headerStyle: DateRangePickerHeaderStyle(backgroundColor: Colors.white),
              onSelectionChanged: _onSelectionChanged,
              selectionTextStyle: const TextStyle(backgroundColor: Colors.blue),
              selectionMode: DateRangePickerSelectionMode.range,
              // rangeSelectionColor: Colors.green,
            ),
          ),
          ElevatedButton(
            child: const Text('Enabled'),
            onPressed: () {
              log('Selected start date of: $startDate');
              log('S');
            },
          ),
        ],
      ),
    );
  }
}