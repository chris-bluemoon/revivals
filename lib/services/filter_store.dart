import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';

class FilterStore extends ChangeNotifier {


  final double width = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;


  List _filters = []; 
  int noOfFilters = 0;

  get filters => _filters;

  Map<String, bool> sizeMap = {
    '4': false,
    '6': false,
    '8': false,
    '10': false,
  };

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

  Widget mySize(String size, bool selected) {
    return Container(
        margin: const EdgeInsets.all(10),
        width: width * 0.03,
        height: width * 0.03,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (selected) ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black)),
        child: (selected)
            ? Center(
                child:
                    StyledBody(size, color: Colors.white, weight: FontWeight.normal))
            : Center(
                child: StyledBody(size, color: Colors.black, weight: FontWeight.normal)));
  } 

  List<Widget> generateSizes() {
    List<Widget> sizes = [];
    sizeMap.forEach((key, value) {
      sizes.add(mySize(key, value));
    });
    return sizes;
  }

  void loadFilters(filters) {
    Map<String, bool> sizeMap = {
    '4': false,
    '6': false,
    '8': false,
    '10': false,
  };
    filters.add(sizeMap);
  }
  void saveFilters(filters) {
    _filters = filters;
  }

  List getFilters() {
    return filters;
  }



}
