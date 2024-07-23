import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';
import 'package:unearthed/screens/home/home_page_card.dart';
import 'package:unearthed/screens/home/offer_widget.dart';
import 'package:unearthed/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List items = [1, 2];
  int currentIndex = 0;

  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          // Display first column object, the carousel
          SizedBox(height: 20),
          CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                height: 250,
                autoPlay: true),
            items: items.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.white),
                      // child: StyledHeading('text $i'));
                      child: Stack(
                        children: [
                          Image.asset('assets/img/backgrounds/carousel_image_1.jpg'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const OfferWidget(),
                          ),
                        ],)
                      // child: Image.asset('assets/img/dresses/LEXI_Dione_Dress.webp'),
                      // child: Image.asset('assets/img/backgrounds/carousel_image_1.jpg'),
                  );
                },
              );
            }).toList(),
          ),

          // Display dot indicators for carousel

          DotsIndicator(
            dotsCount: items.length,
            position: currentIndex.toDouble(),
            decorator: const DotsDecorator(
              colors: [Colors.grey, Colors.grey],
              activeColor: Colors.black,
              // colors: [Colors.grey[300], Colors.grey[600], Colors.grey[900]], // Inactive dot colors
            ),
          ),

          // Now display the first home page widget, for now a simple icon button

          Container(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: IconButton(
                onPressed: () => Navigator.pushNamed(context, '/new_arrivals'),
                icon: Icon(Icons.abc)),
          ),

          // A sixed box now follows which contrains the horizontal listview, otherwise we get a renderflex error

          SizedBox(
            height: 100,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: const <Widget>[
                SizedBox(width: 4),
                HomePageCard(),
                HomePageCard(),
                HomePageCard(),
                HomePageCard(),
                HomePageCard(),
                SizedBox(width: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
