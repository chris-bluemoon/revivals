import 'dart:developer';

import 'package:flutter/material.dart';

class RentalDaysRadioWidget extends StatefulWidget {
  const RentalDaysRadioWidget(this.updateDays, {super.key});

  final Function(int) updateDays;

  @override
  State<RentalDaysRadioWidget> createState() => _RentalDaysRadioWidget();
}

class _RentalDaysRadioWidget extends State<RentalDaysRadioWidget> {
  int selectedOption = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('RENTAL TERM', style: TextStyle(fontSize: 12)),
            ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -3),
              title: const Text('1 Day',
                  style: TextStyle(fontSize: 14)),
              trailing: Radio<int>(
                value: 0,
                groupValue: selectedOption,
                // fillColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                    widget.updateDays(1);
                  });
                },
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -3),
              title: const Text('3 Days',
                  style: TextStyle(fontSize: 14)),
              trailing: Radio<int>(
                value: 1,
                groupValue: selectedOption,
                onChanged: (value2) {
                  setState(() {
                    selectedOption = value2!;
                    widget.updateDays(3);
                    log("Button value: $value2");
                  });
                },
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -3),
              title: const Text('5 Days',
                  style: TextStyle(fontSize: 14)),
              trailing: Radio<int>(
                value: 2,
                groupValue: selectedOption,
                onChanged: (value3) {
                  setState(() {
                    selectedOption = value3!;
                    widget.updateDays(5);
                    log("Button value: $value3");
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}