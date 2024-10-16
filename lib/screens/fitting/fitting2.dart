import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/shared/styled_text.dart';


class Fitting2 extends StatefulWidget {
  const Fitting2({super.key});

  @override
  State<Fitting2> createState() => _Fitting2State();
}

class _Fitting2State extends State<Fitting2> {


  late DateTime? pickedDate = DateTime.now();

  @override
  void initState() {
     super.initState();
     for (Item i in allItems) {
      Map selectableItem = {'name': i.name, 'selectable': false};
      selectableItems.add(selectableItem);
      log('Adding item ${i.name}');
     }

  }

  List<Map> chosenItems = [];
  List<Map> selectableItems = [];
  
  Color containerColour = Colors.white;
  bool isSelected = false;

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List newChosenItems = List.from(chosenItems);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.2,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle('BOOK A FITTING'),
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
  body: Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              height: 400,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // padding: const EdgeInsets.all(8),
                      itemCount: selectableItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = !isSelected;
                              selectableItems[index]['selected'] = isSelected;
                            });
                          },
                          child: Container(
                          height: 30,
                          color: (selectableItems[index]['selected'] == true) ? Colors.green : Colors.white,
                          child: Center(child: Text(selectableItems[index]['name']))
                          ),
                        );
                      }
                                ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                IconButton(
                  onPressed: () { 
                                    for (Map i in newChosenItems) {
                                      if (i['selected'] == true) {
                                        chosenItems.remove(i);
                                      }
                                    }
                                    setState(() {
                                    });
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
                IconButton(
                  onPressed: () {
                    for (Map i in selectableItems) {
                      if (i['selected'] == true) {
                        chosenItems.add({'name': i['name'], 'selected': false});
                      }
            
                    }
                                    setState(() {
                                    });
                  }, 
                  icon: const Icon(Icons.chevron_right),
                )
            
            ],),
          ),
                    Expanded(
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: newChosenItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = !isSelected;
                              newChosenItems[index]['selected'] = isSelected;
                            });
                          },
                          child: Container(
                          height: 50,
                          color: (newChosenItems[index]['selected'] == true) ? Colors.green : Colors.white,
                          child: Center(child: Text(newChosenItems[index]['name'])),
                          ),
                        );
                      }
                                ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  ),
  bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ],
        ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                if (pickedDate != null) Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                    },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      side: const BorderSide(width: 1.0, color: Colors.black),
                      ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: StyledHeading('CONTINUE', weight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                if (pickedDate == null) Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      log('MOVING ON');
                      // ready = false;
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                      side: const BorderSide(width: 1.0, color: Colors.black),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: StyledHeading('CONTINUE', color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),   
    );
  }
}