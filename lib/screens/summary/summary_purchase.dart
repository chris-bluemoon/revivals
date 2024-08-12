import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/summary/congrats.dart';
import 'package:unearthed/screens/summary/delivery_radio_widget.dart';
import 'package:unearthed/screens/summary/purchase_price_summary.dart';
import 'package:unearthed/screens/summary/rental_price_summary.dart';
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

var uuid = const Uuid();

class SummaryPurchase extends StatefulWidget {
  SummaryPurchase(
      this.item, this.startDate, this.endDate, this.noOfDays, this.price,
      {super.key});

  final Item item;
  final DateTime startDate;
  final DateTime endDate;
  final int noOfDays;
  final int price;

  ValueNotifier<int> deliveryPrice = ValueNotifier<int>(0);

  @override
  State<SummaryPurchase> createState() => _SummaryPurchaseState();
}

class _SummaryPurchaseState extends State<SummaryPurchase> {
  // final int i;
  @override
  Widget build(BuildContext context) {
    
    // int pricePerDay = widget.price~/widget.noOfDays;

    void handleSubmit(String renterId, String itemId, String startDate,
        String endDate, int price) {
      
      Provider.of<ItemStore>(context, listen: false)
          .addItemRenter(ItemRenter(
        id: uuid.v4(),
        renterId: renterId,
        itemId: itemId,
        transactionType: 'purchase',
        startDate: startDate,
        endDate: endDate,
        price: price,
      ));
    }


    
    void updateDeliveryPrice(int newDeliveryPrice) {
      log('DELIVERY PRICE CHANGED to $newDeliveryPrice');
      setState(() {
        widget.deliveryPrice.value = newDeliveryPrice;
      });
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
            SummaryImageWidget(widget.item),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.calendar_month_outlined),
                SizedBox(width: 20),
                Text(DateFormat.yMMMd().format(widget.startDate), style: TextStyle(fontSize: 14)),

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
                    Text('Buy for ${widget.price}${globals.thb}', style: TextStyle(fontSize: 16)),
                    // SizedBox(height: 5),
                    // Text('(${pricePerDay}${globals.thb} per day)', style: TextStyle(fontSize: 14)),
                  ],
                ),),
            ),

            SizedBox(height: 20),
            Divider(height:1, indent: 50, endIndent: 50, color: Colors.grey[200],),
            // SizedBox(height: 20),
            DeliveryRadioWidget(updateDeliveryPrice),
            Divider(height:1, indent: 50, endIndent: 50, color: Colors.grey[300],),
            ValueListenableBuilder(
              valueListenable: widget.deliveryPrice,
              builder: (BuildContext context, int val, Widget? child) {
                return PurchasePriceSummary(widget.price, val);
            }),

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
                      String email = Provider.of<ItemStore>(context, listen: false).renter.email;
                      String startDateText = widget.startDate.toString();
                      String endDateText = widget.endDate.toString();
                      handleSubmit(email, widget.item.id, startDateText, endDateText,
                          widget.item.buyPrice);
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
    content: Text("      Your item is being prepared"),  
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