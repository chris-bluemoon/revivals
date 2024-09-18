import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({required this.setFilter, required this.setValues, super.key});

  final Function setValues;
  final Function setFilter;

  @override
  State<FiltersPage> createState() => _FiltersPage();
}

class _FiltersPage extends State<FiltersPage> {
  Widget mySize(String size, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          sizeMap[size] = !selected;
        });
      },
      child: Container(
          margin: const EdgeInsets.all(10),
          width: 50,
          height: 50.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (selected) ? Colors.black : Colors.white,
              border: Border.all(color: Colors.black)),
          child: (selected)
              ? Center(
                  child:
                      Text(size, style: const TextStyle(color: Colors.white)))
              : Center(
                  child: Text(size,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18)))),
    );
  }

  Widget myCircle(Color colour, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          colourMap[colour] = !selected;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colour,
            border: Border.all(color: Colors.black)),
        child: (selected)
            ? const Icon(Icons.check_circle_rounded, color: Colors.white)
            : null,
      ),
    );
  }

  Widget myLength(String length, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          lengthMap[length] = !selected;
        });
      },
      child: Container(
          margin: const EdgeInsets.all(10),
          width: 100,
          height: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: (selected) ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(40),
          ),
          child: (selected)
              ? Center(
                  child:
                      Text(length, style: const TextStyle(color: Colors.white)))
              : Center(
                  child: Text(length,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18)))),
    );
  }

  Widget myPrint(String print, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          printMap[print] = !selected;
        });
      },
      child: Container(
          margin: const EdgeInsets.all(10),
          width: 150,
          height: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: (selected) ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(40),
          ),
          child: (selected)
              ? Center(
                  child:
                      Text(print, style: const TextStyle(color: Colors.white)))
              : Center(
                  child: Text(print,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18)))),
    );
  }

  Widget mySleeve(String sleeve, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          printMap[sleeve] = !selected;
        });
      },
      child: Container(
          margin: const EdgeInsets.all(10),
          width: 160,
          height: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: (selected) ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(40),
          ),
          child: (selected)
              ? Center(
                  child:
                      Text(sleeve, style: const TextStyle(color: Colors.white)))
              : Center(
                  child: Text(sleeve,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18)))),
    );
  }

  Map<Color, bool> colourMap = {
    Colors.black: false,
    Colors.white: false,
    Colors.blue: false,
    Colors.green: false,
    Colors.pink: false,
    Colors.grey: false,
    Colors.brown: false,
    Colors.yellow: false,
    Colors.purple: false,
    Colors.red: false,
    Colors.lime: false,
    Colors.cyan: false,
    Colors.teal: false
  };

  Map<String, bool> sizeMap = {
    '4': false,
    '6': false,
    '8': false,
    '10': false,
  };

  bool filterOn = false;
  bool getFilterOn() {
    if (colourFilter == false && sizeFilter == false) {
      filterOn = false;
      log('filterOn is now set to $filterOn');
      return filterOn;
    }
    filterOn = true;
    log('filterOn is now set to ${filterOn.toString()}');
    return filterOn;
  }

  bool colourFilter = false;
  List<String> getColours() {
    List<String> returnColours = [];
    colourMap.forEach((key, value) {
      if (value == true) {
        colourFilter = true;
        log('FILTERS_PAGE/getColours ----------- Set colourFilter to $colourFilter');
        switch (key) {
          case Colors.black:
            returnColours.add('Black');
            break;
          case Colors.white:
            returnColours.add('White');
            break;
          case Colors.blue:
            returnColours.add('Blue');
            break;
          case Colors.green:
            returnColours.add('Green');
            break;
          case Colors.pink:
            returnColours.add('Pink');
            break;
          case Colors.grey:
            returnColours.add('Grey');
            break;
          case Colors.brown:
            returnColours.add('Brown');
            break;
          case Colors.yellow:
            returnColours.add('Yellow');
            break;
          case Colors.purple:
            returnColours.add('Purple');
            break;
          case Colors.lime:
            returnColours.add('Lime');
            break;
          case Colors.cyan:
            returnColours.add('Cyan');
            break;
          case Colors.teal:
            returnColours.add('Teal');
            break;
        }
      }
    });
    if (returnColours.isEmpty) {
      colourFilter = false;
      colourMap.forEach((key, value) {
        switch (key) {
          case Colors.black:
            returnColours.add('Black');
            break;
          case Colors.white:
            returnColours.add('White');
            break;
          case Colors.blue:
            returnColours.add('Blue');
            break;
          case Colors.green:
            returnColours.add('Green');
            break;
          case Colors.pink:
            returnColours.add('Pink');
            break;
          case Colors.grey:
            returnColours.add('Grey');
            break;
          case Colors.brown:
            returnColours.add('Brown');
            break;
          case Colors.yellow:
            returnColours.add('Yellow');
            break;
          case Colors.purple:
            returnColours.add('Purple');
            break;
          case Colors.lime:
            returnColours.add('Lime');
            break;
          case Colors.cyan:
            returnColours.add('Cyan');
            break;
          case Colors.teal:
            returnColours.add('Teal');
            break;
        }
      });
    }
    log('Returning colour List: $returnColours');
    return returnColours;
  }

  bool sizeFilter = false;
  List<String> getSizes() {
    List<String> returnSizes = [];
    sizeMap.forEach((key, value) {
      if (value == true) {
        sizeFilter = true;
        returnSizes.add(key);
      }
    });
    if (returnSizes.isEmpty) {
      sizeFilter = false;
      sizeMap.forEach((key, value) {
        returnSizes.add(key);
      });
    }
    log('Returning size List: $returnSizes');
    return returnSizes;
  }
  // Map<String, bool> sizeMap = {
  //   'XXS': false,
  //   'XS': false,
  //   'S': false,
  //   'M': false,
  //   'L': false,
  //   'XL': false
  // };

  Map<String, bool> lengthMap = {
    'SHORT': false,
    'MEDIUM': false,
    'LONG': false
  };

  Map<String, bool> printMap = {'ETHNIC': false, 'BOHO': false, 'PREPPY': false, 'FLORAL' : false, 'ABSTRACT': false, 'STRIPES': false, 'DOTS': false, 'TEXTURED': false, 'NONE': false};
  Map<String, bool> sleeveMap = {'SLEEVELESS': false, 'SHORT SLEEVE': false, '3/4 SLEEVE': false, 'LONG SLEEVE': false};

  List<Widget> generateLengths() {
    List<Widget> lengths = [];
    lengthMap.forEach((key, value) {
      lengths.add(myLength(key, value));
    });
    return lengths;
  }
  List<Widget> generatePrints() {
    List<Widget> prints = [];
    printMap.forEach((key, value) {
      prints.add(myPrint(key, value));
    });
    return prints;
  }
  List<Widget> generateSleeves() {
    List<Widget> sleeves = [];
    sleeveMap.forEach((key, value) {
      sleeves.add(mySleeve(key, value));
    });
    return sleeves;
  }

  List<Widget> generateSizes() {
    List<Widget> sizes = [];
    sizeMap.forEach((key, value) {
      sizes.add(mySize(key, value));
    });
    return sizes;
  }

  List<Widget> generateColours() {
    List<Widget> circles = [];
    colourMap.forEach((key, value) {
      circles.add(myCircle(key, value));
    });
    return circles;
  }

  double currentPriceValue = 5000;
  double lowerPriceValue = 0;
  double upperPriceValue = 5000;
  RangeValues rangeVals = const RangeValues(0, 10000);
  RangeLabels rangeLabels = const RangeLabels('0', '10000');

  void resetValues() {
    rangeVals = const RangeValues(0, 10000);
    rangeLabels = const RangeLabels('0', '10000');
    sizeMap = {
      '4': false,
      '6': false,
      '8': false,
      '10': false,
    };
    // sizeMap = {
    //   'XXS': false,
    //   'XS': false,
    //   'S': false,
    //   'M': false,
    //   'L': false,
    //   'XL': false
    // };
    colourMap = {
      Colors.black: false,
      Colors.white: false,
      Colors.blue: false,
      Colors.green: false,
      Colors.pink: false,
      Colors.grey: false,
      Colors.brown: false,
      Colors.yellow: false,
      Colors.purple: false,
      Colors.red: false,
      Colors.lime: false,
      Colors.cyan: false,
      Colors.teal: false
    };
    lengthMap = {'SHORT': false, 'MEDIUM': false, 'LONG': false};
    printMap = {'ETHNIC': false, 'BOHO': false, 'PREPPY': false, 'FLORAL' : false, 'ABSTRACT': false, 'STRIPES': false, 'DOTS': false, 'TEXTURED': false, 'NONE': false};
    sleeveMap = {'SLEEVELESS': false, 'SHORT SLEEVE': false, '3/4 SLEEVE': false, 'LONG SLEEVE': false};

    generateColours();
    generateSizes();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.1,
        title: const StyledTitle('FILTER'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close, size: width * 0.08),
          onPressed: () {
            log(colourMap.toString());
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.02),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Divider(),
            const StyledHeading('COLOUR'),
            SizedBox(height: width * 0.02),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
              child: Wrap(
                direction: Axis.horizontal,
                children: generateColours(),
              ),
            ),
            SizedBox(height: width * 0.05),
            const Divider(),
            const StyledHeading('SIZE'),
            SizedBox(height: width * 0.02),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
              child: Wrap(
                direction: Axis.horizontal,
                children: generateSizes(),
              ),
            ),
            SizedBox(height: width * 0.05),
            const Divider(),
            StyledHeading(
                'PRICE (${rangeLabels.start.toString()} to ${rangeLabels.end.toString()})'),
            SizedBox(height: width * 0.02),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
              child: RangeSlider(
                  inactiveColor: Colors.grey[300],
                  divisions: 10,
                  activeColor: Colors.black,
                  max: 10000,
                  values: rangeVals,
                  // labels: rangeLabels,
                  // onChangeStart: (value) {
                  //   setState(() {
                  //     lowerPriceValue = value;
                  //   });
                  // },
                  onChanged: (values) {
                    setState(() {
                      rangeVals = values;
                      rangeLabels = RangeLabels(values.start.round().toString(),
                          values.end.round().toString());
                    });
                  }),
            ),
            SizedBox(height: width * 0.05),
            const Divider(),
            const StyledHeading('LENGTH'),
            SizedBox(height: width * 0.02),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
              child: Wrap(
                direction: Axis.horizontal,
                children: generateLengths(),
              ),
            ),
            SizedBox(height: width * 0.05),
            const Divider(),
            const StyledHeading('PRINT'),
            SizedBox(height: width * 0.02),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
              child: Wrap(
                direction: Axis.horizontal,
                children: generatePrints(),
              ),
            ),
            SizedBox(height: width * 0.05),
            const Divider(),
            const StyledHeading('SLEEVE'),
            SizedBox(height: width * 0.02),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
              child: Wrap(
                direction: Axis.horizontal,
                children: generateSleeves(),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        // height: 300,
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
        child: Row(children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  resetValues();
                  widget.setValues(getColours(), getSizes());
                  widget.setFilter(getFilterOn());
                });
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (SummaryPurchase(widget.item, DateTime.now(), DateTime.now(), 0, widget.item.buyPrice, symbol))));
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.0),
                ),
                side: const BorderSide(width: 1.0, color: Colors.black),
              ),
              child: const StyledHeading('RESET'),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                widget.setValues(getColours(), getSizes());
                widget.setFilter(getFilterOn());
                // widget.setValues([Colors.black], getSizes());
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.0),
                ),
                side: const BorderSide(width: 1.0, color: Colors.black),
              ),
              child: const StyledHeading('APPLY', color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
