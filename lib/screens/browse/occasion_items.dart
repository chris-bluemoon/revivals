import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/filters_page.dart';
import 'package:unearthed/shared/item_card.dart';
import 'package:unearthed/shared/no_items_found.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class OccasionItems extends StatefulWidget {
  const OccasionItems(this.occasion, {super.key});

  final String occasion;

  @override
  State<OccasionItems> createState() => _OccasionItemsState();
}

class _OccasionItemsState extends State<OccasionItems> {

    Badge myBadge = const Badge(child: Icon(Icons.filter));
 
    List<Item> occasionItems = [];

    @override
    initState() {
      // getCurrentUser();
      occasionItems = [];
      super.initState();
    }

  late List<String> sizes = [];
  late List<String> lengths = [];
  late List<String> prints = [];
  late List<String> sleeves = [];
  late Set coloursSet = <String>{};
  late bool filterOn = false;
  late int numOfFilters = 0;

  void setValues(List<String> filterColours, List<String> filterSizes, List<String> filterLengths, List<String> filterPrints, List<String> filterSleeves) {
    sizes = filterSizes;
    lengths = filterLengths;
    prints = filterPrints;
    sleeves = filterSleeves;
    coloursSet = {...filterColours};
    setState(() {});
  }

  void setFilter(bool filter, int noOfFilters) {
    filterOn = filter;
    log('OCCASSION_PAGE - filterOn set to $filterOn');
    numOfFilters = noOfFilters;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
    // getCurrentUser();
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    occasionItems.clear();
    if (filterOn == true) {
      log(sizes.toString());
      log(sleeves.toString());
      log(lengths.toString());
    for (Item i in allItems) {
      if (i.occasion.contains(widget.occasion) 
             && sizes.contains(i.size.toString()) 
             && lengths.contains(i.length.toString()) 
             && prints.contains(i.print.toString()) 
             && sleeves.contains(i.sleeve.toString()) 
            && coloursSet.intersection({...i.colour}).isNotEmpty
            ) 
          {
          occasionItems.add(i);
        }
    }
    } else {
    for (Item i in allItems) {
      if (i.occasion.contains(widget.occasion)) {
          occasionItems.add(i);
        }
    }
    }
    bool itemsFound = false;
    if (occasionItems.isEmpty) {itemsFound = false;} else {itemsFound = true;}
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle(widget.occasion.toUpperCase()),
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
          icon: Icon(Icons.chevron_left, size: width*0.08),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Badge(
            offset: const Offset(-40, 10),
            isLabelVisible: (numOfFilters > 0) ? true : false,
            label: Text(numOfFilters.toString()),
            child: IconButton(
                onPressed: () 
                  {
                    log('Going to filter');
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => (FiltersPage(setFilter: setFilter, setValues: setValues))));
                  },
                icon: Icon(Icons.filter_list_sharp, size: width*0.06)),
          ),
        ],
      ),

      body: (itemsFound) ? Container(
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
                        child: ItemCard(occasionItems[index]),
                        onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(occasionItems[index]))));
                        }),
                    itemCount: occasionItems.length,
                  ),
                );
              }),
 
            ],
          )) : const NoItemsFound()
    );
  }
}
