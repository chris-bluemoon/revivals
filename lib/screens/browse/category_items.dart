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

List<Item> categoryItems = [];
    List<Item> suggestions = [];

var uuid = const Uuid();
// final List<String> list = <String>['ALilL', '4', '6', '8', '10'];
    final List<String> sorts = ['price high to low', 'price low to high', 'brand', 'name', 'size'];
    final List<String> sizes = ['All', '4', '6', '8', '10'];
    final List<String> colours = ['All Colours', 'Black', 'White'];
    // final List<String> colours = ['All Colours', 'Black', 'White', 'Red', 'Blue', 'Yellow', 'Green', 'Pink', 'Silver','Beige-Nude', 'Floral Print'];
  List<String> selectedColours = [];
  List<String> selectedSizes = [];
  String dropdownValue = 'All';
  String sortDropDownValue = 'price high to low';
  bool sortHighToLow = false;

class CategoryItems extends StatefulWidget {
  const CategoryItems(this.type, {super.key});

  final String type;

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  // List<String> selectedSizes = [];
  void _sortResults(type) {
    
    setState(() {
      if (type == 'price high to low') {
        suggestions.sort((a, b) => b.rentPrice.compareTo(a.rentPrice));
      } else if (type == 'price low to high') {
        suggestions.sort((a, b) => a.rentPrice.compareTo(b.rentPrice));
        // suggestions = suggestions.reversed.toList();
      } else if (type == 'name') {
        suggestions.sort((a, b) => a.name.compareTo(b.name));
      } else if (type == 'brand') {
        suggestions.sort((a, b) => a.brand.compareTo(b.brand));
      } else if (type == 'size') {
        suggestions.sort((a, b) => a.size.compareTo(b.size));
      }
    });
  }
  void _showMultiSelect() async {

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(colours: colours, sizes: sizes);
      },
    );

    if (results != null) {
      setState(() {
        // log(selectedColours.toString());
        // selectedColours = results[0];
        // selectedColours = results;
        // selectedSizes = resultsSizes;
      });
    }
  }

  @override
  initState() {
    // getCurrentUser();
    categoryItems = [];
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    // List<Item> allItems = List.of(categoryItems);
    for (Item i in allItems) {
      if (widget.type == i.type) {
        categoryItems.add(i);
      }
    }
    selectedSizes = List.from(sizes);
    suggestions = List.from(categoryItems);
    suggestions.sort((a, b) => b.rentPrice.compareTo(a.rentPrice));
    sortDropDownValue = 'price high to low';
    super.initState();
  }

  String dropdownValue = sizes.first;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (suggestions.length != categoryItems.length) {
      log('WARNING, suggestions mismatch');
    }
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
          icon: Icon(Icons.chevron_left, size: width * 0.08),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: Icon(Icons.close, size: width * 0.06)),
        ],
      ),
      body: Container(
          color: Colors.white,
          child: Column(children: [
            Row(
              children: [
              SizedBox(width: width * 0.1),
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                  foregroundColor:
                      Colors.white, //change background color of button
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  side: const BorderSide(width: 1.0, color: Colors.white),
                ),
                    onPressed: _showMultiSelect,
                    child:
                        const Row(
                          children: [
                            Icon(Icons.filter_list, color: Colors.black),
                            SizedBox(width: 10),
                            StyledBody('Filters')
                          ],
                        )),
                const SizedBox(width: 50),
                            const StyledBody('Sort by '),
                            DropdownButton<String>(
                                            value: sortDropDownValue,
                                            icon: const Icon(Icons.swap_vert),
                                            elevation: 16,
                                            style: const TextStyle(fontSize: 24, color: Colors.black),
                                            underline: Container(
                                              height: 2,
                                              color: Colors.black,
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                sortDropDownValue = value!;
                                                _sortResults(value);
                                              });
                                            },
                                            items: sorts.map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                          const Expanded(child: SizedBox()),
                                          Text('Count: ${suggestions.length}'),

              ],
            ),
            const Divider(indent: 50, endIndent: 50,),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.5),
                itemBuilder: (_, index) => GestureDetector(
                    child: ItemCard(suggestions[index]),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              (ToRent(suggestions[index]))));
                    }),
                itemCount: suggestions.length,
              ),
            )
          ])),
    );
  }

}



class MultiSelect extends StatefulWidget {
  final List<String> colours;
  final List<String> sizes;
  const MultiSelect({Key? key, required this.colours, required this.sizes})
      : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // final List<String> selectedColours = [];
  // final List<String> selectedSizes = [];

  void sizeChange(String sizeValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedSizes.add(sizeValue);
      } else {
        selectedSizes.remove(sizeValue);
      }
    });

    if (sizeValue == 'All' && isSelected) {
      setState(() {
        selectedSizes = List.from(sizes);
        dropdownValue = sizeValue;
      });
    }
  }

  void colourChange(String colourValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedColours.add(colourValue);
      } else {
        selectedColours.remove(colourValue);
        selectedColours.remove('All Colours');
      }
    });
    if (colourValue == 'All Colours' && isSelected) {
      setState(() {
      selectedColours = List.from(colours);
      });
    }
  }

  void _cancel() {
    Navigator.pop(context);
  }

  searchItemColour(List<String> colours, List<String> sizes) {
    // categoryItems = Provider.of<ItemStore>(context, listen: false).items;
    // log('Size of categoryItems is: ${categoryItems.length}');
    List<Item> colourSuggestions = [];
    List<Item> sizeSuggestions = [];
    // List<Item> suggestions = categoryItems;
    for (String colour in colours) {
      colourSuggestions = colourSuggestions +
          categoryItems.where((item) {
            final String dressColour = item.colour.toString();
            return dressColour.contains(colour);
          }).toList();
    }
    for (String size in sizes) {
      sizeSuggestions = sizeSuggestions +
          categoryItems.where((item) {
            final String dressSize = item.size.toString();
            return dressSize.contains(size);
          }).toList();
    }
    // for (Item i in sizeSuggestions) {
    //   log('${i.name} being added to suggestions as size is: ${i.size}');
    // }
    final colourSet = {...colourSuggestions};
    final sizeSet = {...sizeSuggestions};
    final intersectionSet = colourSet.intersection(sizeSet);
    // setState(() => categoryItems = suggestions);
    // log(intersectionSet.toString());
    suggestions = intersectionSet.toList();
    // categoryItems = List.from(suggestions);
  }

  void submit() {
    searchItemColour(selectedColours, selectedSizes);
    Navigator.pop(context, selectedColours);
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('Filter'),
      content: SizedBox(
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StyledBody('Colours'),
            ListBody(
              mainAxis: Axis.vertical,
              children: widget.colours.map((item) => CheckboxListTile(
                        value: selectedColours.contains(item),
                        // value: selectedColours.contains(item),
                        title: StyledBody(item, weight: FontWeight.normal,),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (isChecked) => colourChange(item, isChecked!),
                      ))
                  .toList(),
            ),
            const StyledBody('Size'),
                        Row(
                          children: [
                            const SizedBox(width: 30),
                            DropdownButton<String>(
                                            // hint: const Text('HINT'),
                                            value: dropdownValue,
                                            icon: const Icon(Icons.arrow_downward),
                                            elevation: 16,
                                            style: const TextStyle(fontSize: 24, color: Colors.black),
                                            underline: Container(
                                              height: 2,
                                              color: Colors.black,
                                            ),
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.
                                              selectedSizes.clear();
                                              setState(() {
                                                dropdownValue = value!;
                                                sizeChange(value, true);
                                              });
                                            },
                                            items: sizes.map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                          ],
                        ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
                          style: OutlinedButton.styleFrom(
                  textStyle: const TextStyle(color: Colors.white),
                  foregroundColor:
                      Colors.white, //change background color of button
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  side: const BorderSide(width: 1.0, color: Colors.black),
                ),
          onPressed: _cancel, 
          child: const StyledBody('Cancel', color: Colors.white)),
        ElevatedButton(
                          style: OutlinedButton.styleFrom(
                  textStyle: const TextStyle(color: Colors.white),
                  foregroundColor:
                      Colors.white, //change background color of button
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  side: const BorderSide(width: 1.0, color: Colors.black),
                ),
          onPressed: submit, 
          child: const StyledBody('Apply', color: Colors.white)),
      ],
    );
  }
}
