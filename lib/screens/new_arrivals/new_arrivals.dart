import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/screens/home/dress_card.dart';

class NewArrivals extends StatefulWidget {
  const NewArrivals({super.key});

  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // TODO: Title image Not quite centered
          mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logos/unearthed_collections.png', 
                 height: 300,
                                    ),
              ]),
      ),
      body: Container(
        color: Colors.white,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.5),
          itemBuilder: (_, index) => DressCard(dresses[index]),
          itemCount: dresses.length,
        )
      ),
    );


  }
}