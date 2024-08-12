import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/globals.dart' as globals;
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';
import 'package:unearthed/screens/summary/summary_rental.dart';
import 'package:unearthed/services/class_store.dart';

class RentThisNextBar extends StatefulWidget {
  const RentThisNextBar(this.item, this.noOfDays, this.startDate, this.endDate, {super.key});

  final Item item;
  final int noOfDays;
  final DateTime startDate;
  final DateTime endDate;

  @override
  State<RentThisNextBar> createState() => _RentThisNextBarState();
}

class _RentThisNextBarState extends State<RentThisNextBar> {
  @override
  Widget build(BuildContext context) {

    double dayOffSet = 1.0;
    if (widget.noOfDays > 1) {
      dayOffSet = 0.8;
    }
    if (widget.noOfDays > 3) {
      dayOffSet = 0.7;
    }
    int totalPrice = (widget.item.rentPrice * widget.noOfDays * dayOffSet).toInt();
    int offSetPrice = (widget.item.rentPrice * dayOffSet).toInt();

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('$offSetPrice${globals.thb}/day for ${widget.noOfDays} days', style: const TextStyle(fontSize: 18),),
          // child: Text('${totalPrice}${globals.thb} for ${widget.noOfDays} days', style: TextStyle(fontSize: 18),),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.fromLTRB(10,10,20,10),
          child: Expanded(
            child: SizedBox(
              width: 100,
              child: OutlinedButton(
                        onPressed: () {
                        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (Summary('email', widget.item, 'start date','end date')))); 
                        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (Summary())));
                        bool loggedIn = Provider.of<ItemStore>(context, listen: false).loggedIn;
                        loggedIn ? Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => (SummaryRental(widget.item, widget.startDate, widget.endDate, widget.noOfDays, totalPrice))
                        )) : Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const GoogleSignInScreen())));
                        },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0),
                          ),
                          side: const BorderSide(width: 1.0, color: Colors.black),
                          ),
                        child: const Text('NEXT', style: TextStyle(color: Colors.white)),
                      ),
            ),
          ),
        )
      ],
    );
  }
}