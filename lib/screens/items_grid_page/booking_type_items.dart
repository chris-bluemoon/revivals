import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pluralize/pluralize.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/item_card.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';



var uuid = const Uuid();

class BookingTypeItems extends StatefulWidget {
  const BookingTypeItems(this.booking_type, {super.key});

  final String booking_type;

  @override
  State<BookingTypeItems> createState() => _BookingItemsState();
}

class _BookingItemsState extends State<BookingTypeItems> {


 
    List<Item> bookingItems = [];

    @override
    initState() {
      // getCurrentUser();
      bookingItems = [];
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
    // getCurrentUser();
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    for (Item i in allItems) {
      log('checking: ${widget.booking_type} vs database stored type: ${i.bookingType}');
      if (widget.booking_type == i.bookingType || i.bookingType == 'both') {
        bookingItems.add(i);
      }
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.15,
        title: StyledTitle(Pluralize().plural(widget.booking_type).toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:  Icon(Icons.chevron_left, size: width*0.06),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () =>
        //           {Navigator.of(context).popUntil((route) => route.isFirst)},
        //       icon: Icon(Icons.close, size: width*0.06)),
        // ],
      ),

      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Consumer<ItemStore>(
                  // child not required
                  builder: (context, value, child) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.5),
                    itemBuilder: (_, index) => GestureDetector(
                        child: ItemCard(bookingItems[index]),
                        onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(bookingItems[index]))));
                        }),
                    itemCount: bookingItems.length,
                  ),
                );
              }),
 
            ],
          )),
    );
  }
}
