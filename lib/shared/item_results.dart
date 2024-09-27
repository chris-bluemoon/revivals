import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/item_card.dart';
import 'package:unearthed/shared/no_items_found.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class ItemResults extends StatefulWidget {
  const ItemResults(this.attribute, this.value, {super.key});

  final String attribute;
  final String value;

  @override
  State<ItemResults> createState() => _ItemResultsState();
}

class _ItemResultsState extends State<ItemResults> {
  Badge myBadge = const Badge(child: Icon(Icons.filter));


  @override
  initState() {
    // getCurrentUser();
    super.initState();
  }

  List<Item> filteredItems = [];

  late List<String> sizes = [];
  late RangeValues ranges = const RangeValues(0, 0);
  late List<String> lengths = [];
  late List<String> prints = [];
  late List<String> sleeves = [];
  late Set coloursSet = <String>{};
  late bool filterOn = false;
  late int numOfFilters = 0;

  void setValues(
      List<String> filterColours,
      List<String> filterSizes,
      RangeValues rangeValuesFilter,
      List<String> filterLengths,
      List<String> filterPrints,
      List<String> filterSleeves) {
    sizes = filterSizes;
    lengths = filterLengths;
    ranges = rangeValuesFilter;
    prints = filterPrints;
    sleeves = filterSleeves;
    coloursSet = {...filterColours};
    setState(() {});
  }

  void setFilter(bool filter, int noOfFilters) {
    filterOn = filter;
    numOfFilters = noOfFilters;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // getCurrentUser();
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    List<Item> finalItems = [];
    filteredItems.clear();

    if (filterOn == true) {
      log('Filter is on');
      switch (widget.attribute) {
        case 'occasion':
          for (Item i in allItems) {
            log('Attribute is ${widget.attribute} and value is ${widget.value}');
            if (i.occasion.contains(widget.value)) {
              log('Adding item ${i.name}');
              filteredItems.add(i);
            }
          }
        case 'type':
          for (Item i in allItems) {
            if (i.type.contains(widget.value)) {
              filteredItems.add(i);
            }
          }
        case 'dateAdded':
        log('dateAdded');
          for (Item i in allItems) {
            DateFormat format = DateFormat("dd-MM-yyyy");
            DateTime dateSupplied = format.parse(widget.value);
            DateTime dateAdded = format.parse(i.dateAdded);
            if (dateAdded.isAfter(dateSupplied)) {
              filteredItems.add(i);
            }
          }
      }
      for (Item i in filteredItems) {
        // if (i.filteredItems.contains(widget.value)
        if (sizes.contains(i.size.toString()) &&
            lengths.contains(i.length.toString()) &&
            prints.contains(i.print.toString()) &&
            sleeves.contains(i.sleeve.toString()) &&
            coloursSet.intersection({...i.colour}).isNotEmpty &&
            i.rentPrice > ranges.start &&
            i.rentPrice < ranges.end) {
          finalItems.add(i);
        }
      }
    } else {
      // TODO FSDFSDsdfsdfsdfsd
      for (Item i in allItems) {
        switch (widget.attribute) {
          case 'occasion':
            if (i.occasion.contains(widget.value)) {
              finalItems.add(i);
          }
          break;
          case 'type':
            if (i.type.contains(widget.value)) {
              finalItems.add(i);
          }
        case 'dateAdded':
          log('dataAdded no filter');
          for (Item i in allItems) {
            DateFormat format = DateFormat("dd-MM-yyyy");
            DateTime dateSupplied = format.parse(widget.value);
            DateTime dateAdded = format.parse(i.dateAdded);
            log('Is ${dateAdded.toString()} after ${dateSupplied.toString()}');
            if (dateAdded.isAfter(dateSupplied)) {
              log('ADDED');
              finalItems.add(i);
            }
          }
          break;
        }
      }
    }
    bool itemsFound = false;
    if (finalItems.isEmpty) {
      itemsFound = false;
    } else {
      itemsFound = true;
    }
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: width * 0.1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledTitle(widget.value.toUpperCase()),
              // SizedBox(
              //   child: Image.asset(
              //     'assets/logos/eliya.png',
              //     // fit: BoxFit.contain,
              //     // height: 40,
              //   ),
              //   height: 50,
              //   width: 100
              // ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.chevron_left, size: width * 0.08),
            onPressed: () {
              Provider.of<ItemStore>(context, listen: false).resetFilters();
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, width*0.0, width*0.03, 0),
              child: Badge(
                // offset: Offset(-width*0.07, width*0.015),
                // smallSize: width*0.03,
                alignment: Alignment.topLeft,
                isLabelVisible: (numOfFilters > 0) ? true : false,
                label: Text(numOfFilters.toString()),
                child: Image.asset('assets/img/icons/icons8-slider-50.png', height: width*0.05)
                // child: IconButton(
                //     onPressed: () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => (FiltersPage(
                //               setFilter: setFilter, setValues: setValues))));
                //     },
                //     icon: Icon(Icons.filter_list_sharp, size: width * 0.06)),
              ),
            ),
          ],
        ),
        body: (itemsFound)
            ? Container(
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
                              child: ItemCard(finalItems[index]),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        (ToRent(finalItems[index]))));
                              }),
                          itemCount: finalItems.length,
                        ),
                      );
                    }),
                  ],
                ))
            : const NoItemsFound());
  }
}
