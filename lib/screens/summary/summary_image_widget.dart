import 'package:flutter/material.dart';
import 'package:unearthed/models/item.dart';

class SummaryImageWidget extends StatelessWidget {
  SummaryImageWidget(this.item, {super.key});

  final Item item;

  late String itemType;
  late String itemName;
  late String brandName;
  late String imageName;

  String setItemImage() {
    itemType = item.type.replaceAll(RegExp(' +'), '_');
    itemName = item.name.replaceAll(RegExp(' +'), '_');
    brandName = item.brand.replaceAll(RegExp(' +'), '_');
    imageName = '${brandName}_${itemName}_${itemType}_1.jpg';
    return imageName;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: 
              Image.asset('assets/img/new_items/${setItemImage()}', fit: BoxFit.fitHeight, height: 100, width: 80)),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${item.name} from ${item.brand}', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 5),
              Text('${item.type}, size ${item.size.toString()}', style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5))),
          ],)
        ],
      )

    );
  }
}