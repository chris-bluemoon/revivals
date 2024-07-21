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
        title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                 'assets/logos/unearthed_logo_2.png',
                  fit: BoxFit.contain,
                  height: 200,
              ),
            ],

          ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        actions: [
          IconButton(onPressed: () => {
           Navigator.of(context).popUntil((route) => route.isFirst) 
          }, 
            icon: Icon(Icons.close)),
        ],
      ),
      // appBar: AppBar(
      //           actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.close),
      //       onPressed: () {
      //         // handle the press
      //       },
      //     ),
      //   ],
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     // TODO: Title image Not quite centered
      //     mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Image.asset(
      //           'assets/logos/unearthed_collections.png', 
      //            height: 300,
      //                               ),
      //         ]),
      // ),
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