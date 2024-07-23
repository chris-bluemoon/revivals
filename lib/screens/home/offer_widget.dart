import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unearthed/shared/styled_text.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        StyledHeading2('Limited Time Offer'),
        StyledTitle2('90\$ OFF'),
        SizedBox(height: 20),
        StyledHeading2('Enjoy 6 new styles'),
        StyledHeading2('every month'),
        SizedBox(height: 10),
        const SizedBox(
          width: 118.0,
          height: 32.0,
          child: const DecoratedBox(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Use code JUL24'),
            ),
            decoration: const BoxDecoration(color: Colors.white),
          ),
        )
      ],
    );
  }
}
