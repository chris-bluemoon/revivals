import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:provider/provider.dart';
import 'package:unearthed/globals.dart' as globals;
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/get_country_price.dart';
import 'package:unearthed/shared/styled_text.dart';

// ignore: must_be_immutable
class ItemCard extends StatefulWidget {
  const ItemCard(this.item, {super.key});

  final Item item;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  late String imageName;

  late String itemName;

  late String brandName;

  late String itemType;

  bool isFav = false;


String capitalize(string) {
  return string.codeUnitAt(0).toUpperCase() + string.substring(1).toLowerCase();
}

  String setItemImage() {
    itemType = toBeginningOfSentenceCase(widget.item.type.replaceAll(RegExp(' +'), '_'));
    // itemType = widget.item.type.replaceAll(RegExp(' +'), '_');
    itemName = widget.item.name.replaceAll(RegExp(' +'), '_');
    brandName = widget.item.brand.replaceAll(RegExp(' +'), '_');
    imageName = '${brandName}_${itemName}_${itemType}_1.jpg';
    log(imageName);
    return imageName;
  }

  bool isAFav(Item d, List favs) {
    // log(favs.toString());
    if (favs.contains(d)) {
      return true;
    } else {
      return false;
    } 
  }

    void _toggleFav() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      log('Toggled Fav');
      if (isFav == true) {
        isFav = false;
      } else {
        isFav = true;
      }
    });}

  String convertedRentPrice = '-1';
  String convertedBuyPrice = '-1';
  String convertedRRPPrice = '-1';
  String symbol = '?';

  @override
  void initState() {
    // List currListOfFavs =
    //     Provider.of<ItemStore>(context, listen: false).favourites;
    // isFav = isAFav(widget.item, currListOfFavs);
    super.initState();
  }

  int getPricePerDay(noOfDays) {
    String country = Provider.of<ItemStore>(context, listen: false).renter.settings[0];
    
    int oneDayPrice = widget.item.rentPrice;
    // log('oneDayPrice: ${widget.item.rentPrice}');

    if (country == 'BANGKOK') {
      oneDayPrice = widget.item.rentPrice;
    } else {
      oneDayPrice = int.parse(convertFromTHB(widget.item.rentPrice, country));
    }

    if (noOfDays == 3) {
      int threeDayPrice = (oneDayPrice * 0.8).toInt()-1;
      if (country == 'BANGKOK') {
        return (threeDayPrice ~/ 100) * 100 + 100;
      } else {
        return (threeDayPrice ~/ 5) * 5 + 5;
      }
    }
    if (noOfDays == 5) {
      int fiveDayPrice = (oneDayPrice * 0.6).toInt()-1;
      if (country == 'BANGKOK') {
        return (fiveDayPrice ~/ 100) * 100 + 100;
      } else {
        return (fiveDayPrice ~/ 5) * 5 + 5;
      }
    }
    return oneDayPrice;
  }

  void setPrice() {
    if (Provider.of<ItemStore>(context, listen: false).renter.settings[0] !=
        'BANGKOK') {
      String country = Provider.of<ItemStore>(context, listen: false).renter.settings[0];
      convertedRentPrice = getPricePerDay(5).toString();
      convertedBuyPrice = convertFromTHB(widget.item.buyPrice, country);
      convertedRRPPrice = convertFromTHB(widget.item.rrp, country);
      symbol = getCurrencySymbol(country);
    } else {
      convertedRentPrice = getPricePerDay(5).toString();
      convertedBuyPrice = widget.item.buyPrice.toString();
      convertedRRPPrice = widget.item.rrp.toString();
      symbol = globals.thb;
    }
  }

  String getSize(sizeArray) {
    String formattedSize = 'N/A';
    if (sizeArray.length == 1) {
      formattedSize = sizeArray.first;
    }
    if (sizeArray.length == 2) {
      String firstSize;
      String secondSize;
      firstSize = sizeArray.elementAt(0);
      secondSize = sizeArray.elementAt(1);
       formattedSize = '$firstSize-$secondSize';
    }
    return formattedSize;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List currListOfFavs =
        Provider.of<ItemStore>(context, listen: false).favourites;
    isFav = isAFav(widget.item, currListOfFavs);
    setPrice();
    return Card(
      
      shape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Center(child: StyledHeading(widget.item.brand)),
            SizedBox(height: width * 0.02),
            // Image.asset('assets/img/items/${setItemImage()}', width: 200, height: 600),
            Expanded(child: Center(child: Image.asset('assets/img/items2/${setItemImage()}')),),
            // Image.asset('assets/img/items/${setItemImage()}', fit: BoxFit.fill),
            Row(
              // mainAxisAlignment: MainAxisAlignment.left,
              children: [
                 SizedBox(
                  width: width * 0.3,
                  child: StyledHeading(widget.item.name)),
                const Expanded(child: SizedBox()),
                isFav ?  IconButton(
                  icon: Icon(Icons.favorite, size: width*0.05), color: Colors.red,
                  onPressed: () {
                    log('Pressed Fav');
                      // isFav = false;
                      _toggleFav();
                      // Provider.of<ItemStore>(context, listen: false)
                      //   .toggleItemFav(item);
                      Renter toSave = Provider.of<ItemStore>(context, listen: false).renter;
                      log('toSave renter: ${toSave.name}');
                      toSave.favourites.remove(widget.item.id);
                      Provider.of<ItemStore>(context, listen: false).saveRenter(toSave);
                      Provider.of<ItemStore>(context, listen: false).removeFavourite(widget.item);
                      log('Removing Favourite item ${widget.item.name}');

                  }) : 
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined, size: width*0.05),
                    onPressed: () {
                      log('Pressed empty Fav on item ID: ${widget.item.id}');
                      // isFav = true;
                      _toggleFav();
                      // Provider.of<ItemStore>(context, listen: false)
                      //   .toggleItemFav(item);
                      Renter toSave = Provider.of<ItemStore>(context, listen: false).renter;
                      log('toSave renter: ${toSave.name}');
                      toSave.favourites.add(widget.item.id);
                      Provider.of<ItemStore>(context, listen: false).saveRenter(toSave);
                      Provider.of<ItemStore>(context, listen: false).addFavourite(widget.item);
                    }
                  )
                  
              ],
            ),
            // StyledBody('Size UK ${widget.item.size.toString()}', weight: FontWeight.normal),
            StyledBody('Size UK ${getSize(widget.item.size)}', weight: FontWeight.normal),
            // StyledText('Size: ${item.size.toString()}'),
            // int convertedRentPrice = convertFromTHB(${widget.item.rentPrice}, 'SGD');
            if (widget.item.bookingType == 'both' || widget.item.bookingType == 'rental') StyledBody('Rent from $convertedRentPrice$symbol per day', weight: FontWeight.normal),
            if (widget.item.bookingType == 'both' || widget.item.bookingType == 'buy') StyledBody('Buy for $convertedBuyPrice$symbol', weight: FontWeight.normal),
            StyledBodyStrikeout('RRP $convertedRRPPrice$symbol', weight: FontWeight.normal),
          ],
        ),
      ),
    );
  }
}