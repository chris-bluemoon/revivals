import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/screens/home/home_page_bottom_card.dart';
import 'package:unearthed/screens/home/new_arrivals_home_widget.dart';
import 'package:unearthed/screens/home/offer_home_widget.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: SizedBox(
              // TODO: Image is not centered in appbar with back arrow
              // mainAxisAlignment: MainAxisAlignment.center,
              child: Image.asset(
                  'assets/logos/unearthed_logo_2.png',
                  // 'assets/logos/unearthed_collections.png',
                  fit: BoxFit.contain,
                  height: 200,
                ),
              ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display first column object, the carousel
              const SizedBox(height: 20),
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
                      return const OfferWidget();
                    },
                  );
                }).toList(),
              ),

              // Display dot indicators for carousel

              Center(
                child: DotsIndicator(
                  dotsCount: items.length,
                  position: currentIndex.toDouble(),
                  decorator: const DotsDecorator(
                    colors: [Colors.grey, Colors.grey],
                    activeColor: Colors.black,
                    // colors: [Colors.grey[300], Colors.grey[600], Colors.grey[900]], // Inactive dot colors
                  ),
                ),
              ),

              // Now display the first home page widget, for now a simple icon button

              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: StyledHeading(
                  'NEW RENTALS',
                ),
              ),
              const NewArrivalsHomeWidget(),

              // A sixed box now follows which contrains the horizontal listview, otherwise we get a renderflex error

              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: StyledHeading('HELP CENTRE'),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: height * 0.1,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    SizedBox(width: 4),
                    HomePageBottomCard('Our Hygiene Policy'),
                    HomePageBottomCard('General FAQ'),
                    HomePageBottomCard('What Is Unearthed Collections?'),
                    HomePageBottomCard('How It Works'),
                    HomePageBottomCard('Sizing Guide FAQ'),
                    SizedBox(width: 4),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
