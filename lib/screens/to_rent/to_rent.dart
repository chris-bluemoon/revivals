import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/globals.dart' as globals;
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';
import 'package:unearthed/screens/summary/summary_purchase.dart';
import 'package:unearthed/screens/to_rent/item_widget.dart';
import 'package:unearthed/screens/to_rent/rent_this_with_date_selecter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

// ignore: must_be_immutable
class ToRent extends StatefulWidget {
  ToRent(this.item, {super.key});

  @override
  State<ToRent> createState() => _ToRentState();

  final Item item;
  late String itemName;
  late String imageName;
  late String itemType; 

  // String setItemImage() {
  //   itemType = item.type.replaceAll(RegExp(' '), '_');
  //   itemName = item.name.replaceAll(RegExp(' '), '_');
  //   imageName = '${item.brand}_${itemName}_${itemType}.webp';
  //   return imageName;
  // }

  final ValueNotifier<int> rentalDays = ValueNotifier<int>(0);

}

class _ToRentState extends State<ToRent> {
  
  List items = [1, 2];
  int currentIndex = 0;

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle(widget.item.name.toUpperCase()),
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
          icon: Icon(Icons.arrow_back, size: width*0.06),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: Icon(Icons.close, size: width*0.06)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  height: 400,
                  autoPlay: true),
              items: items.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return ItemWidget(item: widget.item, itemNumber: i);
                    // return const SizedBox(child: Text("BOX"), height: 20, width: 20);
                  },
                );
              }).toList(),
            ),
            Center(
              child: DotsIndicator(
                dotsCount: items.length,
                position: currentIndex.toDouble(),
                decorator: const DotsDecorator(
                  colors: [Colors.grey, Colors.grey],
                  activeColor: Colors.black,
                  // colors: [Colors.grey[300], Colors.grey[600], Colors.grey[900]], // Inactive dot colors
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: StyledHeading(widget.item.description),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10),
              child: StyledBody('Rental price: ${widget.item.rentPrice.toString()} ${globals.thb}'),
              // child: StyledBody('Rental price: ${widget.item.rentPrice.toString()} ${getCurrency()}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: StyledBody(widget.item.longDescription, weight: FontWeight.normal),
            ),
            // if (widget.item.rentPrice > 0) Padding(
              // padding: const EdgeInsets.only(left: 20, bottom: 10),
              // child: RentalDaysRadioWidget(updateRentalDays),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ],
        ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [

                (widget.item.buyPrice > 0) ? Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      log('Pushing to SummaryPurchase');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => (SummaryPurchase(widget.item, DateTime.now(), DateTime.now(), 0, widget.item.buyPrice))));
                    },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      side: const BorderSide(width: 1.0, color: Colors.black),
                      ),
                    child: const StyledHeading('BUY PRELOVED'),
                )) : const Expanded(child: SizedBox()),
                const SizedBox(width: 5),
                (widget.item.rentPrice > 0) ? Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                        bool loggedIn = Provider.of<ItemStore>(context, listen: false).loggedIn;
                        if (loggedIn) { Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => (RentThisWithDateSelecter(widget.item, widget.rentalDays.value))
                        // )) : goToLogin();
                        )); } else { 
                          showAlertDialog(context);
                        }
                    },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      side: const BorderSide(width: 1.0, color: Colors.black),
                      ),
                    child: const StyledHeading('RENT THIS', color: Colors.white),
                  ),
                ) : const Expanded(child: SizedBox()),
              ],
            ),
          ),      
      );
  }
}

showAlertDialog(BuildContext context) {  
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
      // Navigator.of(context).popUntil((route) => route.isFirst);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const GoogleSignInScreen()))); 

    },  
    child: const Center(child: StyledHeading("OK", color: Colors.white)),  
  ); 
    // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: const Center(child: StyledHeading("NOT LOGGED IN")),
    content: const SizedBox(
      height: 60,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledHeading("Please log in"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledHeading("or register to continue!"),
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

class StyledText {
  const StyledText(String s);
}

