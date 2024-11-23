import 'package:flutter/material.dart';
import 'package:revivals/shared/item_results.dart';
import 'package:revivals/shared/styled_text.dart';

class AllItemsHomeWidget extends StatelessWidget {
  const AllItemsHomeWidget({super.key});



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Image.asset('assets/img/backgrounds/3.jpg'),
  
    );
  }
}
