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
  int noOfFilters = 0;
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
                      Text(size, style: const TextStyle(color: Colors.white, fontSize: 18)))
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
                      Text(length, style: const TextStyle(color: Colors.white, fontSize: 18)))
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
                      Text(print, style: const TextStyle(color: Colors.white, fontSize: 18)))
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
          sleeveMap[sleeve] = !selected;
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
                      Text(sleeve, style: const TextStyle(color: Colors.white, fontSize: 18)))
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
    if (colourFilter == false && sizeFilter == false && lengthFilter == false && printFilter == false && sleeveFilter == false) {
      filterOn = false;
      return filterOn;
    }
    filterOn = true;
    return filterOn;
  }


  bool colourFilter = false;
  List<String> getColours() {
    List<String> returnColours = [];
    colourMap.forEach((key, value) {
      if (value == true) {
        colourFilter = true;
        log('Set colourFilter to true');
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
    if (colourFilter == true) {noOfFilters++;}
    if (returnColours.isEmpty) {
      colourFilter = false;
      log('Now setting colour filter to false');
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
    if (sizeFilter == true) {noOfFilters++;}
    if (returnSizes.isEmpty) {
      sizeFilter = false;
      sizeMap.forEach((key, value) {
        returnSizes.add(key);
      });
    }
    return returnSizes;
  }

  bool lengthFilter = false;
  List<String> getLengths() {
    List<String> returnLengths = [];
    lengthMap.forEach((key, value) {
      if (value == true) {
        lengthFilter = true;
        returnLengths.add(key);
      }
    });
    if (lengthFilter == true) {noOfFilters++;}
    if (returnLengths.isEmpty) {
      lengthFilter = false;
      lengthMap.forEach((key, value) {
        returnLengths.add(key);
      });
    }
    return returnLengths;
  }

  bool printFilter = false;
  List<String> getPrints() {
    List<String> returnPrints = [];
    printMap.forEach((key, value) {
      if (value == true) {
        printFilter = true;
        returnPrints.add(key);
      }
    });
    if (printFilter == true) {noOfFilters++;}
    if (returnPrints.isEmpty) {
      printFilter = false;
      printMap.forEach((key, value) {
        returnPrints.add(key);
      });
    }
    return returnPrints;
  }

  bool sleeveFilter = false;
  List<String> getSleeves() {
    List<String> returnSleeves = [];
    sleeveMap.forEach((key, value) {
      if (value == true) {
        sleeveFilter = true;
        returnSleeves.add(key);
      }
    });
    if (sleeveFilter == true) {noOfFilters++;}
    if (returnSleeves.isEmpty) {
      sleeveFilter = false;
      sleeveMap.forEach((key, value) {
        returnSleeves.add(key);
      });
    }
    return returnSleeves;
  }
  // TODO: To add a filter, add a getPrints, add to setValues as parameter, add to Occassions page setValues and IF statement, add to getFilterOn, add to database
  // Map<String, bool> sizeMap = {
  //   'XXS': false,
  //   'XS': false,
  //   'S': false,
  //   'M': false,
  //   'L': false,
  //   'XL': false
  // };

  Map<String, bool> lengthMap = {
    'mini': false,
    'midi': false,
    'long': false
  };

  Map<String, bool> printMap = {'enthic': false, 'boho': false, 'preppy': false, 'floral' : false, 'abstract': false, 'stripes': false, 'dots': false, 'textured': false, 'none': false};
  Map<String, bool> sleeveMap = {'sleeveless': false, 'short sleeve': false, '3/4 sleeve': false, 'long sleeve': false};

  List<Widget> generateLengths() {
    List<Widget> lengths = [];
    lengthMap.forEach((key, value) {
      lengths.add(myLength(key, value));
    });
    return lengths;
  }
  List<Widget> generatePrints() {
    log('generatePrints');
    List<Widget> prints = [];
    printMap.forEach((key, value) {
      prints.add(myPrint(key, value));
    });
    return prints;
  }
  List<Widget> generateSleeves() {
    log('Genreate sleeves');
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

  List resetValues() {
    rangeVals = const RangeValues(0, 10000);
    rangeLabels = const RangeLabels('0', '10000');
    colourMap.updateAll((name, value) => value = false);
    sizeMap.updateAll((name, value) => value = false);
    lengthMap.updateAll((name, value) => value = false);
    printMap.updateAll((name, value) => value = false);
    sleeveMap.updateAll((name, value) => value = false);
    // lengthMap = {'SHORT': false, 'MEDIUM': false, 'LONG': false};
    // printMap = {'ETHNIC': false, 'BOHO': false, 'PREPPY': false, 'FLORAL' : false, 'ABSTRACT': false, 'STRIPES': false, 'DOTS': false, 'TEXTURED': false, 'NONE': false};
    // sleeveMap = {'SLEEVELESS': false, 'SHORT SLEEVE': false, '3/4 SLEEVE': false, 'LONG SLEEVE': false};

    // generateColours();
    // generateSizes();
    List a = [];
    a.add(colourMap);
    a.add(sizeMap);
    a.add(lengthMap);
    a.add(printMap);
    a.add(sleeveMap);
    return a;
  }

  void setFilters(List filters) {
    colourFilter = filters[0];
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // setFilters(Provider.of<ItemStore>(context, listen: false).filters);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.1,
        title: const StyledTitle('FILTER'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close, size: width * 0.08),
          onPressed: () {
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
                  widget.setValues(getColours(), getSizes(), getLengths(), getPrints(), getSleeves());
                  widget.setFilter(getFilterOn(), noOfFilters);
                  // noOfFilters = 0;
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
                // setFilters(Provider.of<ItemStore>(context, listen: false).filters);
                widget.setValues(getColours(), getSizes(), getLengths(), getPrints(), getSleeves());
                widget.setFilter(getFilterOn(), noOfFilters);
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
