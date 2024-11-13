import 'package:flutter/material.dart';
import 'package:unearthed/shared/item_results.dart';
import 'package:unearthed/shared/styled_text.dart';

class RentalHomeWidget extends StatelessWidget {
  const RentalHomeWidget({super.key});



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Image.asset(
          'assets/img/backgrounds/1.jpg'),
    );
  }
}
