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
    List newSelectableItems = List.from(selectableItems);
    // newChosenItems.sort((m1, m2) {
    //   var r = m1["name"].compareTo(m2["name"]);
    //   if (r != 0) return r;
    //   return m1["name"].compareTo(m2["name"]);
    //   });
    log('Build - newChosenItems length: ${newChosenItems.length}');
    newSelectableItems.sort((m1, m2) {
      var r = m1["name"].compareTo(m2["name"]);
      if (r != 0) return r;
      return m1["name"].compareTo(m2["name"]);
      });

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
      const Row(children: [
        SizedBox(width: 48),
        StyledBody('SELECT FROM', weight: FontWeight.normal),
        SizedBox(width: 210),
        StyledBody('ADD TO', weight: FontWeight.normal),
      ],),
      const Row(children: [
        SizedBox(width: 48),
        StyledBody('OUR COLLECTION'),
        SizedBox(width: 152),
        StyledBody('YOUR WARDROBE'),
      ],),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(width * 0.02),
              margin: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0),
              decoration: BoxDecoration(
                          image: const DecorationImage(
            image: AssetImage("assets/img/items2/ALC_Delfina_Pleated_Cutout_Dress_1.jpg"),
            fit: BoxFit.cover,
          ),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              height: width * 1,
              child: Column(
                children: [
                  Expanded(
                    child: Scrollbar(
                      child: ListView.separated(
                      separatorBuilder: (_, __) => const Divider(height: 0.5),
                        scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        // padding: const EdgeInsets.all(8),
                        itemCount: newSelectableItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = !isSelected;
                                newSelectableItems[index]['selected'] = isSelected;
                              });
                            },
                            child: Container(
                            height: width * 0.1,
                            // width: 100,
                            color: (newSelectableItems[index]['selected'] == true) ? Colors.lightGreen.shade100 : Colors.white,
                            child: Center(
                              child: StyledBody(newSelectableItems[index]['name'], weight: FontWeight.normal))
                            ),
                          );
                        }
                                  ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: width * 0.17),
              if (newChosenItems.isNotEmpty) IconButton(
                onPressed: () { 
                                  for (Map i in newChosenItems) {
                                    if (i['selected'] == true) {
                                      chosenItems.remove(i);
                                      selectableItems.add({'name': i['name'], 'selected': false});
                                    }
                                  }
                                  setState(() {
                                  });
                },
                icon: const Icon(Icons.chevron_left),
              ),
              if (newChosenItems.length < 6) IconButton(
                onPressed: () {
                  for (Map i in newSelectableItems) {
                    if (i['selected'] == true) {
                      chosenItems.add({'name': i['name'], 'selected': false});
                      selectableItems.remove(i);
                    }
          
                  }
                                  setState(() {
                                  });
                }, 
                icon: const Icon(Icons.chevron_right),
              )
          ],),
                    Expanded(
            child: Container(
              padding: EdgeInsets.all(width * 0.02),
              margin: EdgeInsets.fromLTRB(0, 0, width * 0.05, 0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 400,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (_, __) => const Divider(height: 0.5),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // padding: const EdgeInsets.all(8),
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
                          height: width * 0.1,
                          color: (newChosenItems[index]['selected'] == true) ? Colors.lightGreen.shade100 : Colors.white,
                          child: Center(child: StyledBody(newChosenItems[index]['name'], weight: FontWeight.normal,)),
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