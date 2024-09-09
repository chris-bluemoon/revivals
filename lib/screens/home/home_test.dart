import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unearthed/controllers/item_controller.dart';


class HomeTest extends StatelessWidget {
  const HomeTest({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemController itemController = Get.find();
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: SizedBox(
              height: 200,
              width: 200,
              child: FadeInImage(
                image: NetworkImage(itemController.allItemImages[index]),
                placeholder: const AssetImage("assets/logos/aje.png")
              ),
            )
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemCount:itemController.allItemImages.length)

    );
  }
}