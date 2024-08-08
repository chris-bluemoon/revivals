import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/models/item.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key, required this.item, required this.itemNumber});

  final int itemNumber;
  final Item item;



  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  
  late String itemName;
  late String brandName;
  late String imageName;

  String setItemImage() {
    itemName = widget.item.name.replaceAll(RegExp(' +'), '_');
    brandName = widget.item.brand.replaceAll(RegExp(' +'), '_');
    imageName = 'assets/img/new_items/${brandName}_${itemName}_Item_${widget.itemNumber}.jpg';
    return imageName;
  }

  @override
  Widget build(BuildContext context) {
                      // String itemImage = 'assets/img/new_items/${widget.item.brand}_${widget.item.name}_Item_${widget.itemNumber}.jpg';
                      // return FittedBox(
                        
                        return Image.asset(setItemImage(), fit: BoxFit.contain);
                        // child: Image.asset(setItemImage(),),
                        // fit: BoxFit.fill,
                      // );

  }
}
