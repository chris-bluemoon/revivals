import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:unearthed/screens/new_arrivals/new_arrivals.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 CarouselController buttonCarouselController = CarouselController(); 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true),
            items: [1,2].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber
                    ),
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                  );
                },
              );
            }).toList(),
          ),
            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => NewArrivals()),
            //   );
            //   log('Just pushed NewArrivals');
            // }
          TextButton(
            onPressed: () => buttonCarouselController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.linear),
              child: Text('→'),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/new_arrivals'),
            icon: Icon(Icons.abc)
          ),
        ],
        
      ),
    );

  }
}