import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/item_card.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class StyleItems extends StatefulWidget {
  const StyleItems(this.style, {super.key});

  final String style;

  @override
  State<StyleItems> createState() => _StyleItemsState();
}

class _StyleItemsState extends State<StyleItems> {


   void updateFittingsCount(fittingsCount) {
    fittingsCount = fittingsCount;
  }
 
    List<Item> styleItems = [];

    @override
    initState() {
      // getCurrentUser();
      styleItems = [];
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    // getCurrentUser();
        double width = MediaQuery.of(context).size.width;
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    log('Size of allItems: ${allItems.length}');
    for (Item i in allItems) {
      log('checking: ${widget.style} vs database stored style: ${i.style}');
      if (widget.style == i.style) {
        styleItems.add(i);
      }
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle(widget.style.toUpperCase()),

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
          IconButton(
              onPressed: () =>
                  {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, width * 0.01, 0),
                child: Icon(Icons.close, size: width*0.06),
              )),
        ],
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
                        child: ItemCard(styleItems[index], false, false),
                        onTap: () {
                          log(styleItems[0].toString());
                            // log('About to rent ${value.brandItemes[index].name}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(styleItems[index]))));
                        }),
                    itemCount: styleItems.length,
                  ),
                );
              }),
            ],
          )),
    );
  }
}
