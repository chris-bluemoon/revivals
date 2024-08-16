import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/globals.dart' as globals;
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/screens/summary/delivery_radio_widget.dart';
import 'package:unearthed/screens/summary/rental_price_summary.dart';
import 'package:unearthed/screens/summary/summary_image_widget.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/send_email2.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class SummaryRental extends StatefulWidget {
  SummaryRental(
      this.item, this.startDate, this.endDate, this.noOfDays, this.price,
      {super.key});

  final Item item;
  final DateTime startDate;
  final DateTime endDate;
  final int noOfDays;
  final int price;

  final ValueNotifier<int> deliveryPrice = ValueNotifier<int>(0);

  @override
  State<SummaryRental> createState() => _SummaryRentalState();
}

class _SummaryRentalState extends State<SummaryRental> {
  // final int i;
  @override
  Widget build(BuildContext context) {
    
    int pricePerDay = widget.price~/widget.noOfDays;

    void handleSubmit(String renterId, String itemId, String startDate,
        String endDate, int price) {
      
      Provider.of<ItemStore>(context, listen: false)
          .addItemRenter(ItemRenter(
        id: uuid.v4(),
        renterId: renterId,
        itemId: itemId,
        transactionType: 'rental',
        startDate: startDate,
        endDate: endDate,
        price: price,
      ));
    }

    void updateDeliveryPrice(int newDeliveryPrice) {
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
            const SizedBox(height: 10),
            SummaryImageWidget(widget.item),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.calendar_month_outlined),
                const SizedBox(width: 20),
                Text(DateFormat.yMMMd().format(widget.startDate), style: const TextStyle(fontSize: 14)),
                const Text('   -   '),
                Text(DateFormat.yMMMd().format(widget.endDate), style: const TextStyle(fontSize: 14)),

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
                // height: 50,
                // width: 350,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (widget.noOfDays > 1) ? Text('Rent for ${widget.noOfDays} days (at $pricePerDay${globals.thb} per day)', style: const TextStyle(fontSize: 16))
                    : Text('Rent for ${widget.price}${globals.thb}', style: const TextStyle(fontSize: 16))
                    // Text('($pricePerDay${globals.thb} per day)', style: const TextStyle(fontSize: 14)),
                  ],
                ),),
            ),

            const SizedBox(height: 20),
            Divider(height:1, indent: 50, endIndent: 50, color: Colors.grey[200],),
            // SizedBox(height: 20),
            DeliveryRadioWidget(updateDeliveryPrice),
            Divider(height:1, indent: 50, endIndent: 50, color: Colors.grey[300],),
            ValueListenableBuilder(
              valueListenable: widget.deliveryPrice,
              builder: (BuildContext context, int val, Widget? child) {
                log('Deliver fee being sent as val to RentalPriceSummary is: $val');
                return RentalPriceSummary(widget.price, widget.noOfDays, val);
            }),

            Row(
              children: [
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.0),
                        ),
                        side: const BorderSide(width: 1.0, color: Colors.black),
                        ),
                    onPressed: () {
                      String email = Provider.of<ItemStore>(context, listen: false).renter.email;
                      String name = Provider.of<ItemStore>(context, listen: false).renter.name;
                      String startDateText = widget.startDate.toString();
                      String endDateText = widget.endDate.toString();
                      handleSubmit(email, widget.item.id, startDateText, endDateText,
                          widget.item.rentPrice);
                      String startDateTextForEmail = DateFormat('yMMMd').format(widget.startDate);
                      String endDateTextForEmail = DateFormat('yMMMd').format(widget.endDate);
                      EmailComposer2(email, widget.item.type, name, widget.item.name, widget.item.brand, startDateTextForEmail, endDateTextForEmail, widget.deliveryPrice.value, widget.price.toString(), widget.item.rentPrice.toString()).sendEmail2();
                      showAlertDialog(context, widget.item.type);  
                      // Navigator.of(context).push(MaterialPageRoute(
                          // builder: (context) => (const Congrats())));
                    },
                    child: const Text('CONFIRM', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
showAlertDialog(BuildContext context, String itemType) {  
  // Create button  
  Widget okButton = ElevatedButton(  
    style: OutlinedButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.white),
                          foregroundColor: Colors.white,//change background color of button
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: const BorderSide(width: 1.0, color: Colors.black),
      ),
    onPressed: () {  
      // Navigator.of(context).pop();  
      Navigator.of(context).popUntil((route) => route.isFirst);
    },  
    child: const Center(child: Text("OK")),  
  ); 
    // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: const Center(child: Text("Thank You!")),
    content: Container(
      height: 60,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your $itemType is being prepared,"),
              // Text("Your $itemType is being prepared,"),
              // Text("please check your email for confirmation."),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Please check your email for details."),
              // Text("Your $itemType is being prepared,"),
              // Text("please check your email for confirmation."),
            ],
          ),
        ],
      ),
    ),  
    actions: [  
      okButton,  
    ],  
                shape: const RoundedRectangleBorder(
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