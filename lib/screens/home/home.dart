import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';
import 'package:unearthed/screens/home/home_page_card.dart';
import 'package:unearthed/screens/new_arrivals/new_arrivals.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 List items = [1,2];
 int currentIndex = 0;

 CarouselController buttonCarouselController = CarouselController(); 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                              },
              height: 300.0,
              autoPlay: true),
            items: items.map((i) {
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
          DotsIndicator(
            dotsCount: items.length,
            position: currentIndex.toDouble(),
              decorator: const DotsDecorator(
    colors: [Colors.grey, Colors.grey],
    activeColor: Colors.black,
    // colors: [Colors.grey[300], Colors.grey[600], Colors.grey[900]], // Inactive dot colors
  ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/new_arrivals'),
              icon: Icon(Icons.abc)
            ),
          ),
        Expanded(
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
              HomePageCard(),
              SizedBox(width: 20),
              HomePageCard(),
              SizedBox(width: 20),
              HomePageCard(),
              SizedBox(width: 20),
              HomePageCard(),
              SizedBox(width: 20),
              HomePageCard(),
              SizedBox(width: 20),
            ],
          ),
        ),
        ],
        
        
      ),
    );

  }
}