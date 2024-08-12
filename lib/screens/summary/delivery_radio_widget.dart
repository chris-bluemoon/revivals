import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/summary/congrats.dart';
import 'package:unearthed/screens/summary/summary_image_widget.dart';
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
            Text('DELIVERY OPTION', style: TextStyle(fontSize: 14)),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: -3),
              title: Text('We will deliver at 100${globals.thb}',
                  style: TextStyle(fontSize: 14)),
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
              visualDensity: VisualDensity(vertical: -3),
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
