import 'package:flutter/material.dart';
import 'package:unearthed/models/item.dart';

class ConfirmRentWidget extends StatefulWidget {
  const ConfirmRentWidget(this.item, {super.key});

  final Item item;

  @override
  State<ConfirmRentWidget> createState() => _ConfirmRentWidget();
}

class _ConfirmRentWidget extends State<ConfirmRentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text('Rent ${widget.item.name} for ${widget.item.rentPrice} Baht')
        Text('Rent for ${widget.item.rentPrice} Baht')
      ],
    );
  }
}