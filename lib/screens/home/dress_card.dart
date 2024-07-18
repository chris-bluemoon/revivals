import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/theme.dart';

class DressCard extends StatelessWidget {
  const DressCard(this.dress, {super.key});

  final Dress dress;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dress.name),
                Image.asset('assets/img/dresses/${dress.image}', 
                  width: 80
                ),
              ],
            ),

            const SizedBox(width: 20),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(dress.brand),
                const SizedBox(height: 30),
                const Text('Rental Price'),
                Text(dress.price.toString()),
                Text('Size ${dress.size.toString()}'),
              ]
            ),

            const Expanded(
              child: SizedBox(),
            ),
            
            // IconButton(
            //   onPressed: () {
            //   },
            //   icon: Icon(Icons.arrow_forward, color: AppColors.textColor)
            // ),
          ]
        ),
      ),
    );
  }
}