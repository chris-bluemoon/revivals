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

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> selectedItems = [];

  void itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedItems.add(itemValue);
      } else {
        selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop;
  }

  void _submit() {
    Navigator.pop(context, selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select sizes'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) => CheckboxListTile(
            value: selectedItems.contains(item), 
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (isChecked) => itemChange(item, isChecked!),
            )).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: _cancel, 
            child: const Text('Cancel')
          ),
          ElevatedButton(
            onPressed: _submit, 
            child: const Text('Submit')
          ),
         ],);
  }

}

var uuid = const Uuid();
final List<String> list = <String>['4', '6', '8', '10'];
class CategoryItems extends StatefulWidget {
  const CategoryItems(this.type, {super.key});

  final String type;

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {


  List<String> selectedItems = [];
  void _showMultiSelect() async {
    final List<String> items = ['4', '6', '8', '10'];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    if (results != null) {
      setState(() {
        selectedItems = results;
      });
    }
  }

    
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
String dropdownValue = list.first;
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
          child: Column(children: [
            DropdownButton<String>(
      hint: const Text('HINT'),
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          searchItem(value);
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(16,16,16,16),
            //   child: TextField(
            //     controller: controller,
            //     decoration: InputDecoration(
            //       prefixIcon: const Icon(Icons.search),
            //       hintText: 'Name',
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: const BorderSide(color: Colors.black))
            //     ),
            //     onChanged: searchItem,
            //   )
            // ),

            ElevatedButton(
              onPressed: _showMultiSelect, 
              child: const Icon(Icons.filter_alt_outlined, color: Colors.black)),
              Wrap(
                children: selectedItems.map((e) => Chip(
                    label: Text(e),
                )).toList(),
              ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.5),
                itemBuilder: (_, index) => GestureDetector(
                    child: ItemCard(categoryItems[index]),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              (ToRent(categoryItems[index]))));
                    }),
                itemCount: categoryItems.length,
              ),
            )
          ])),
    );
  }

  searchItem(String query) {
    categoryItems = Provider.of<ItemStore>(context, listen: false).items;
    final suggestions = categoryItems.where((item) {
      final String dressSize = item.size.toString();
      final input = query.toLowerCase();

      return dressSize.contains(input);
    }).toList();

    setState(() => categoryItems = suggestions);
  }
}
