import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pluralize/pluralize.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/browse/designer_item_card.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/filters_page.dart';
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
  late Set sizesSet = <String>{};
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
    sizesSet = {...filterSizes};
    log(coloursSet.toString());
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
      switch (widget.attribute) {
        case 'brand':
          for (Item i in allItems) {
            if (i.brand.contains(widget.value)) {
              filteredItems.add(i);
            }
          }
        case 'occasion':
          for (Item i in allItems) {
            if (i.occasion.contains(widget.value)) {
              filteredItems.add(i);
            }
          }
        case 'type':
          for (Item i in allItems) {
            if (i.type.contains(widget.value)) {
              filteredItems.add(i);
            }
          }
        case 'bookingType':
          log('Found bookingType');
          for (Item i in allItems) {
            if (i.bookingType.contains(widget.value)) {
              filteredItems.add(i);
            }
          }
        case 'dateAdded':
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
        Set myset = {...i.colour};
        log(myset.toString());
        if (coloursSet.intersection(myset).isNotEmpty) {
          log('Adding colour set ${coloursSet.intersection(myset).toString()}');
        }
        if (sizes.contains(i.size.toString()) &&
            lengths.contains(i.length.toString()) &&
            prints.contains(i.print.toString()) &&
            sleeves.contains(i.sleeve.toString()) &&
            coloursSet.intersection(myset).isNotEmpty &&
            sizesSet.intersection({...i.size}).isNotEmpty &&
            i.rentPrice > ranges.start &&
            i.rentPrice < ranges.end) {
              log('Adding item ${i.name}');
              finalItems.add(i);
        }
      }
    } else {
      // TODO FSDFSDsdfsdfsdfsd
      for (Item i in allItems) {
        switch (widget.attribute) {
          case 'brand':
            if (i.brand.contains(widget.value)) {
              finalItems.add(i);
          }
          case 'occasion':
            if (i.occasion.contains(widget.value)) {
              finalItems.add(i);
          }
          case 'type':
            if (i.type.contains(widget.value)) {
              finalItems.add(i);
          }
        case 'bookingType':
          for (Item i in allItems) {
            if (i.bookingType.contains(widget.value)) {
              finalItems.add(i);
            }
          }
        case 'dateAdded':
          for (Item i in allItems) {
            DateFormat format = DateFormat("dd-MM-yyyy");
            DateTime dateSupplied = format.parse(widget.value);
            DateTime dateAdded = format.parse(i.dateAdded);
            if (dateAdded.isAfter(dateSupplied)) {
              finalItems.add(i);
            }
          }
        }
      }
    }
    bool itemsFound = false;
    if (finalItems.isEmpty) {
      itemsFound = false;
    } else {
      itemsFound = true;
    }
    String setTitle(attribute) {
      String title = 'TO SET';
      switch (attribute) {
        case 'dateAdded':  {
          title = 'LATEST ADDITIONS';
        }
        case 'brand':  {
          title = widget.value.toUpperCase();
        }
        case 'occasion':  {
          title = widget.value.toUpperCase();
        }
        case 'bookingType':  {
          title = Pluralize().plural(widget.value).toUpperCase();
        }
      }

      return title;
    }
    log(filteredItems.length.toString());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: width * 0.1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledTitle(setTitle(widget.attribute))
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        (FiltersPage(setFilter: setFilter, setValues: setValues))));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, width*0.0, width*0.03, 0),
                child: (numOfFilters == 0) ? Image.asset('assets/img/icons/1.png', height: width * 0.15) :
                  (numOfFilters == 1) ? Image.asset('assets/img/icons/2.png', height: width * 0.15) :
                  (numOfFilters == 2 ) ? Image.asset('assets/img/icons/3.png', height: width * 0.15) :
                  (numOfFilters == 3 ) ? Image.asset('assets/img/icons/4.png', height: width * 0.15) :
                  (numOfFilters == 4 ) ? Image.asset('assets/img/icons/5.png', height: width * 0.15) :
                  (numOfFilters == 5 ) ? Image.asset('assets/img/icons/6.png', height: width * 0.15) :
                  (numOfFilters == 6 ) ? Image.asset('assets/img/icons/7.png', height: width * 0.15) :
                  Image.asset('assets/img/icons/1.png', height: width * 0.15)
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
                              child: (widget.attribute == 'brand') ? DesignerItemCard(finalItems[index]) :
                                ItemCard(finalItems[index]),
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
