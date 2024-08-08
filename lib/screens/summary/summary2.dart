import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/summary/congrats.dart';
import 'package:unearthed/screens/summary/delivery_radio_widget.dart';
import 'package:unearthed/screens/summary/price_summary.dart';
import 'package:unearthed/screens/summary/summary_image_widget.dart';
import 'package:unearthed/screens/to_rent/confirm_rent.dart';
import 'package:unearthed/screens/to_rent/rent_this_next_bar.dart';
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
import 'package:unearthed/globals.dart' as globals;

var uuid = const Uuid();

class Summary2 extends StatefulWidget {
  const Summary2(
      this.dress, this.startDate, this.endDate, this.noOfDays, this.price,
      {super.key});

  final Dress dress;
  final DateTime startDate;
  final DateTime endDate;
  final int noOfDays;
  final int price;

  @override
  State<Summary2> createState() => _Summary2State();
}

class _Summary2State extends State<Summary2> {
  // final int i;
  @override
  Widget build(BuildContext context) {
    
    int pricePerDay = widget.price~/widget.noOfDays;

    void handleSubmit(String renterId, String dressId, String startDate,
        String endDate, int price) {
      
      Provider.of<DressStore>(context, listen: false)
          .addDressRenter(DressRenter(
        id: uuid.v4(),
        renterId: renterId,
        dressId: dressId,
        startDate: startDate,
        endDate: endDate,
        price: price,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle('Review and Pay'),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            SummaryImageWidget(widget.dress),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.calendar_month_outlined),
                SizedBox(width: 20),
                Text(DateFormat.yMMMd().format(widget.startDate), style: TextStyle(fontSize: 14)),
                Text('   -   '),
                Text(DateFormat.yMMMd().format(widget.endDate), style: TextStyle(fontSize: 14)),

              ],),
            const SizedBox(height: 20),
            const Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.location_pin),
                SizedBox(width: 20),
                Text('Bangkok, Thailand', style: TextStyle(fontSize: 14)),
              ],),
            const SizedBox(height: 40),
            Center(
              child: Container(
                color: Colors.grey[200],
                height: 70,
                width: 350,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rent for ${widget.noOfDays} days at ${widget.price}${globals.thb}', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text('(${pricePerDay}${globals.thb} per day)', style: TextStyle(fontSize: 14)),
                  ],
                ),),
            ),

            SizedBox(height: 20),
            Divider(height:1, indent: 50, endIndent: 50, color: Colors.grey[200],),
            // SizedBox(height: 20),
            DeliveryRadioWidget(),
            Divider(height:1, indent: 50, endIndent: 50, color: Colors.grey[300],),
            PriceSummary(widget.price, widget.noOfDays, 0),

            Row(
              children: [
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    child: const Text('CONFIRM', style: TextStyle(color: Colors.white)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.0),
                        ),
                        side: BorderSide(width: 1.0, color: Colors.black),
                        ),
                    onPressed: () {
                      String email = Provider.of<DressStore>(context, listen: false).renter.email;
                      String startDateText = widget.startDate.toString();
                      String endDateText = widget.endDate.toString();
                      handleSubmit(email, widget.dress.id, startDateText, endDateText,
                          widget.dress.rentPrice);
                      showAlertDialog(context);  
                      // Navigator.of(context).push(MaterialPageRoute(
                          // builder: (context) => (const Congrats())));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
showAlertDialog(BuildContext context) {  
  // Create button  
  Widget okButton = ElevatedButton(  
    child: Center(child: Text("OK")),  
    onPressed: () {  
      // Navigator.of(context).pop();  
      Navigator.of(context).popUntil((route) => route.isFirst);
    },  
  ); 
    // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: Center(child: Text("Congratulations")),
    content: Text("      Your dress is being prepared"),  
    actions: [  
      okButton,  
    ],  
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
  );  
    showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );   
}
}