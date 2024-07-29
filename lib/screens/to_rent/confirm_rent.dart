import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';

class ConfirmRentWidget extends StatefulWidget {
  const ConfirmRentWidget(this.dress, {super.key});

  final Dress dress;

  @override
  State<ConfirmRentWidget> createState() => _ConfirmRentWidget();
}

class _ConfirmRentWidget extends State<ConfirmRentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text('Rent ${widget.dress.name} for ${widget.dress.rentPrice} Baht')
        Text('Rent for ${widget.dress.rentPrice} Baht')
      ],
    );
  }
}