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

var uuid = const Uuid();
// final List<String> list = <String>['ALilL', '4', '6', '8', '10'];
    final List<String> sizes = ['ALL', '4', '6', '8', '10'];
    final List<String> colours = ['Black', 'White', 'Red', 'Blue', 'Yellow'];
  List<String> selectedColours = [];
  final List<String> selectedSizes = [];

class CategoryItems extends StatefulWidget {
  const CategoryItems(this.type, {super.key});

  final String type;

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  List<String> selectedSizes = [];
  void _showMultiSelect() async {

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(colours: colours, sizes: sizes);
      },
    );

    if (results != null) {
      setState(() {
        log(selectedColours.toString());
        // selectedColours = results[0];
        selectedColours = results;
        // selectedSizes = resultsSizes;
      });
    }
  }

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

  // String dropdownValue = sizes.first;
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
            // DropdownButton<String>(
            //   hint: const Text('HINT'),
            //   value: dropdownValue,
            //   icon: const Icon(Icons.arrow_downward),
            //   elevation: 16,
            //   style: const TextStyle(color: Colors.deepPurple),
            //   underline: Container(
            //     height: 2,
            //     color: Colors.deepPurpleAccent,
            //   ),
            //   onChanged: (String? value) {
            //     // This is called when the user selects an item.
            //     setState(() {
            //       dropdownValue = value!;
            //       searchItem(value);
            //     });
            //   },
            //   items: list.map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            // // Container(
            // //   margin: const EdgeInsets.fromLTRB(16,16,16,16),
            // //   child: TextField(
            // //     controller: controller,
            // //     decoration: InputDecoration(
            // //       prefixIcon: const Icon(Icons.search),
            // //       hintText: 'Name',
            // //       border: OutlineInputBorder(
            // //         borderRadius: BorderRadius.circular(5),
            // //         borderSide: const BorderSide(color: Colors.black))
            // //     ),
            // //     onChanged: searchItem,
            // //   )
            // // ),

            Row(
              children: [
              SizedBox(width: width * 0.1),
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                  // textStyle: const TextStyle(color: Colors.white),
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
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                  // textStyle: const TextStyle(color: Colors.white),
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
                            Icon(Icons.swap_vert , color: Colors.black),
                            SizedBox(width: 10),
                            StyledBody('Sort Price')
                          ],
                        )),
              ],
            ),
            const Divider(indent: 50, endIndent: 50,),
            // Wrap(
            //   children: selectedColours
            //       .map((e) => Chip(
            //             label: Text(e),
            //           ))
            //       .toList(),
            // ),
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

  // searchItem(String query) {
  //   categoryItems = Provider.of<ItemStore>(context, listen: false).items;
  //   final suggestions = categoryItems.where((item) {
  //     final String dressSize = item.size.toString();
  //     final input = query.toLowerCase();

  //     return dressSize.contains(input);
  //   }).toList();

  //   setState(() => categoryItems = suggestions);
  // }
}

// class MultiSelectSize extends StatefulWidget {
//   final List<String> items;
//   const MultiSelectSize({Key? key, required this.items}) : super(key: key);

//   @override
//   State<MultiSelectSize> createState() => _MultiSelectSizeState();
// }

// class _MultiSelectSizeState extends State<MultiSelectSize> {
//   final List<String> selectedColours = [];

//   void colourChange(String itemValue, bool isSelected) {
//     setState(() {
//       if (isSelected) {
//         selectedColours.add(itemValue);
//       } else {
//         selectedColours.remove(itemValue);
//       }
//     });
//   }

//   void _cancel() {
//     Navigator.pop(context);
//   }

//   searchItemColour(List<String> colours, List<String> sizes) {
//     categoryItems = Provider.of<ItemStore>(context, listen: false).items;
//     List<Item> suggestions = [];
//     // List<Item> suggestions = categoryItems;
//     for (String colour in colours) {
//       log('Getting $colour');
//       suggestions = suggestions +
//         categoryItems.where((item) {
//         final String dressColour = item.colour.toString();
//         return dressColour.contains(colour);
//     }).toList();
//   }
//     // suggestions = categoryItems.where((item) {
//     //   final String dressColour = item.colour.toString();
//     //   return dressColour.contains(query[0]) || dressColour.contains(query[1]);
//     // }).toList();

//     setState(() => categoryItems = suggestions);
//   }

//   void _submit() {
//     searchItemColour(selectedColours, ['0']);
//     Navigator.pop(context, selectedColours);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Select colours'),
//       content: Column(
//         children: [
//           ListBody(
//             mainAxis: Axis.vertical,
//             children: widget.items.map((item) => CheckboxListTile(
//               value: selectedColours.contains(item),
//               title: Text(item),
//               controlAffinity: ListTileControlAffinity.leading,
//               onChanged: (isChecked) => colourChange(item, isChecked!),
//               )).toList(),
//             ),
//         ],
//       ),
//         actions: [
//           TextButton(
//             onPressed: _cancel,
//             child: const Text('Cancel')
//           ),
//           ElevatedButton(
//             onPressed: _submit,
//             child: const Text('Submit')
//           ),
//          ],);
//   }

// }

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
  }

  void colourChange(String colourValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedColours.add(colourValue);
      } else {
        selectedColours.remove(colourValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  searchItemColour(List<String> colours, List<String> sizes) {
    categoryItems = Provider.of<ItemStore>(context, listen: false).items;
    List<Item> colourSuggestions = [];
    List<Item> sizeSuggestions = [];
    List<Item> suggestions = [];
    // List<Item> suggestions = categoryItems;
    for (String colour in colours) {
      // log('Getting $colour');
      colourSuggestions = colourSuggestions +
          categoryItems.where((item) {
            final String dressColour = item.colour.toString();
            log(dressColour);
            return dressColour.contains(colour);
          }).toList();
    }
    for (String size in sizes) {
      // log('Getting size $size');
      sizeSuggestions = sizeSuggestions +
          categoryItems.where((item) {
            final String dressSize = item.size.toString();
            log(dressSize);
            return dressSize.contains(size);
          }).toList();
    }
    for (Item i in sizeSuggestions) {
      log('${i.name} being added to suggestions as size is: ${i.size}');
    }
    final colourSet = {...colourSuggestions};
    final sizeSet = {...sizeSuggestions};
    final intersectionSet = colourSet.intersection(sizeSet);
    // setState(() => categoryItems = suggestions);
    // log(intersectionSet.toString());
    suggestions = intersectionSet.toList();
    categoryItems = suggestions;
  }

  void submit() {
    searchItemColour(selectedColours, selectedSizes);
    Navigator.pop(context, selectedColours);
  }

  String dropdownValue = sizes.first;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('Filter'),
      content: SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StyledBody('Select colours'),
            // ListBody(
            //   mainAxis: Axis.vertical,
            //   children: widget.sizes
            //       .map((item) => CheckboxListTile(
            //             value: selectedSizes.contains(item),
            //             title: Text(item),
            //             controlAffinity: ListTileControlAffinity.leading,
            //             onChanged: (isChecked) => sizeChange(item, isChecked!),
            //           ))
            //       .toList(),
            // ),
            ListBody(
              mainAxis: Axis.vertical,
              children: widget.colours
                  .map((item) => CheckboxListTile(
                        value: selectedColours.contains(item),
                        // value: selectedColours.contains(item),
                        title: StyledBody(item, weight: FontWeight.normal,),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (isChecked) => colourChange(item, isChecked!),
                      ))
                  .toList(),
            ),
            // const SizedBox(height: 10),
            const StyledBody('Select size'),
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
                                                // searchItem(value);
                                                selectedSizes.add(value);
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
          child: const StyledBody('Submit', color: Colors.white)),
      ],
    );
  }
}
