import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/globals.dart' as globals;

class DeliveryRadioWidget extends StatefulWidget {
  const DeliveryRadioWidget(this.updatePrice, {super.key});

  final Function(int) updatePrice;

  @override
  State<DeliveryRadioWidget> createState() => _DeliveryRadioWidget();
}

class _DeliveryRadioWidget extends State<DeliveryRadioWidget> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('DELIVERY OPTION', style: TextStyle(fontSize: 14)),
            ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -3),
              title: Text('We will deliver at 100${globals.thb}',
                  style: const TextStyle(fontSize: 14)),
              trailing: Radio<int>(
                value: 0,
                groupValue: selectedOption,
                // fillColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                    widget.updatePrice(100);
                    log("Button value: $value");
                  });
                },
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -3),
              title: const Text('I will ararnge a collection',
                  style: TextStyle(fontSize: 14)),
              trailing: Radio<int>(
                value: 1,
                groupValue: selectedOption,
                onChanged: (value2) {
                  setState(() {
                    selectedOption = value2!;
                    widget.updatePrice(0);
                    log("Button value: $value2");
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
