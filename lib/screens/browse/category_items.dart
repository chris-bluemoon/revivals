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

class CategoryItems extends StatefulWidget {
  const CategoryItems(this.type, {super.key});

  final String type;

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {


 
    List<Item> categoryItems = [];

    @override
    initState() {
      // getCurrentUser();
      categoryItems = [];
          List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    for (Item i in allItems) {
      log('checking: ${widget.type} vs database stored type: ${i.type}');
      if (widget.type == i.type) {
        categoryItems.add(i);
      }
    }
      super.initState();
    }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
    // getCurrentUser();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle(Pluralize().plural(widget.type).toUpperCase()),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:  Icon(Icons.chevron_left, size: width*0.08),
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
      ),

      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(16,16,16,16),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black))
                  ),
                  onChanged: searchItem,
                )
              ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.5),
                    itemBuilder: (_, index) => GestureDetector(
                        child: ItemCard(categoryItems[index]),
                        onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(categoryItems[index]))));
                        }),
                    itemCount: categoryItems.length,
                  ),
                )]
          )),
    );
  }

  searchItem(String query) {
    categoryItems = Provider.of<ItemStore>(context, listen: false).items;
    final suggestions = categoryItems.where((item) {
      final dressName = item.name.toLowerCase();
      final input = query.toLowerCase();

      return dressName.contains(input);
    }).toList();

    setState(() => categoryItems = suggestions);
  }
}
