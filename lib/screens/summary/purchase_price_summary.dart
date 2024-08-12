import 'package:flutter/material.dart';
import 'package:unearthed/globals.dart' as globals;

class PurchasePriceSummary extends StatelessWidget {
  const PurchasePriceSummary(this.price, this.deliveryPrice, {super.key});

  final int price;
  final int deliveryPrice;

  @override
  Widget build(BuildContext context) {
    int finalPrice = price + deliveryPrice;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('PRICE DETAILS', style: TextStyle(fontSize: 14)),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Purchase price', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                const Expanded(child: SizedBox()),
                Text('$price${globals.thb}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Delivery fee', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                const Expanded(child: SizedBox()),
                Text('$deliveryPrice${globals.thb}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const Text('Total', style: TextStyle(fontSize: 16, color: Colors.black)),
                const Expanded(child: SizedBox()),
                Text('$finalPrice${globals.thb}', style: const TextStyle(fontSize: 16, color: Colors.black)),
            
              ],
            ),
          ),
      ],),
    );
  }
}