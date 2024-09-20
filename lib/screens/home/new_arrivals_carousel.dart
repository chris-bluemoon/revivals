import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/shared/item_results.dart';

class NewArrivalsCarousel extends StatefulWidget {
  const NewArrivalsCarousel({super.key});

  @override
  State<NewArrivalsCarousel> createState() => _NewArrivalsCarouselState();
}

class _NewArrivalsCarouselState extends State<NewArrivalsCarousel> {
  final CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    List items = [1, 2, 3, 4];
    int currentIndex = 0;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const ItemResults('dateAdded', '01-01-2025'))));
      },
      child: Container(
        child: CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                        viewportFraction: 0.3,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        height: width * 0.4,
                        autoPlay: true),
                    items: items.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          // return NewArrivalsCarousel(i);
                          return SizedBox(
                            child: Image.asset('assets/img/backgrounds/new_arrivals_image_$i.jpg')
                          );
                        },
                      );
                    }).toList(),
                  ),
      ),
    );

  }
}