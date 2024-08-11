import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/globals.dart' as globals;

// ignore: must_be_immutable
class ItemCard extends StatefulWidget {
  ItemCard(this.item, {super.key});

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

  String setItemImage() {
    itemType = widget.item.type.replaceAll(RegExp(' +'), '_');
    itemName = widget.item.name.replaceAll(RegExp(' +'), '_');
    brandName = widget.item.brand.replaceAll(RegExp(' +'), '_');
    imageName = '${brandName}_${itemName}_${itemType}_1.jpg';
    log(imageName);
    return imageName;
  }

  bool isAFav(Item d, List favs) {
    log(favs.toString());
    if (favs.contains(d)) {
      log("Found a fav!");
      log(d.id);
      return true;
    } else {
      log("This not a fav!");
      log(d.id);
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
      if (isFav == true) {
        isFav = false;
      } else {
        isFav = true;
      }
    });}

    @override
    void initState() {
    List currListOfFavs = Provider.of<ItemStore>(context, listen: false).favourites;
    isFav = isAFav(widget.item, currListOfFavs);
     super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Card(
      
      shape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Center(child: StyledHeading(widget.item.brand)),
            // Image.asset('assets/img/new_items/${setItemImage()}', width: 200, height: 600),
            Expanded(child: Image.asset('assets/img/new_items/${setItemImage()}'),),
            // Image.asset('assets/img/new_items/${setItemImage()}', fit: BoxFit.fill),
            Row(
              // mainAxisAlignment: MainAxisAlignment.left,
              children: [
                StyledHeading(widget.item.name),
                Expanded(child: SizedBox()),
                isFav ?  IconButton(
                  icon: Icon(Icons.favorite), color: Colors.red,
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

                  }) : 
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
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
                    }
                  )
                  
              ],
            ),
            // StyledText('Size: ${item.size.toString()}'),
            if (widget.item.rentPrice > 0) StyledBody('Rent for ${widget.item.rentPrice.toString()}${globals.thb} per day'),
            if (widget.item.buyPrice > 0) StyledBody('Buy for ${widget.item.buyPrice.toString()}${globals.thb}'),
            StyledBodyStrikeout('RRP ${widget.item.rrp.toString()}${globals.thb}'),
          ],
        ),
      ),
    );
  }
}