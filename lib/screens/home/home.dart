import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/screens/fitting/fitting.dart';
import 'package:unearthed/screens/home/all_items_home_widget.dart';
import 'package:unearthed/screens/home/fitting_home_widget.dart';
import 'package:unearthed/screens/home/home_page_bottom_card.dart';
import 'package:unearthed/screens/home/new_arrivals_carousel.dart';
import 'package:unearthed/screens/home/offer_home_widget.dart';
import 'package:unearthed/screens/home/rentals_home_widget.dart';
import 'package:unearthed/screens/home/to_buy_home_widget.dart';
import 'package:unearthed/shared/item_results.dart';
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
          toolbarHeight: width*0.2,
          // centerTitle: true,
          title: SizedBox(
              // TODO: Image is not centered in appbar with back arrow
              // mainAxisAlignment: MainAxisAlignment.center,
              child: Image.asset(
                  'assets/logos/unearthed_logo_3.png',
                  // 'assets/logos/unearthed_collections.png',
                  fit: BoxFit.fill,
                  height: width * 0.15,
                  // width: width * 0.4,
                ),
              ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display first column object, the carousel
              SizedBox(height: height*0.01),
              CarouselSlider(
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    height: height * 0.2,
                    autoPlay: true),
                items: items.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return const OfferWidget();
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: width * 0.02),
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
              SizedBox(height: width * 0.02),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: StyledHeading(
                  'ALL ITEMS',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const ItemResults('occasion', 'party'))));
                },
                child: const AllItemsHomeWidget()),

              SizedBox(height: width * 0.02),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: StyledHeading(
                  'NEW ARRIVALS',
                ),
              ),
              // const NewArrivalsHomeWidget(),
              SizedBox(height: width * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const ItemResults('dateAdded', '01-01-2020'))));
                },
                child: const NewArrivalsCarousel()),

              SizedBox(height: width * 0.03),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: StyledHeading(
                  'TO RENT',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const ItemResults('bookingType','rental'))));
                },
                child: const RentalHomeWidget()),

              SizedBox(height: width * 0.02),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: StyledHeading(
                  'TO BUY',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const ItemResults('bookingType','buy'))));
                },
                child: const ToBuyHomeWidget()),

              SizedBox(height: width * 0.02),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: StyledHeading(
                  'BOOK A FITTING ',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const Fitting())));
                },
                child: const FittingHomeWidget()),

              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: StyledHeading('HELP CENTRE'),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: height * 0.10,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    const SizedBox(width: 4),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const HygienePolicy())));
                    //   },
                    //   child: const HomePageBottomCard('Our Hygiene Policy')),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const FAQs())));
                        Navigator.pushNamed(context, '/faqs');
                      },
                      child: const HomePageBottomCard('General FAQs')),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const WhatIs())));
                        Navigator.pushNamed(context, '/whatIs');
                      },
                      child: const HomePageBottomCard('Who Are We?')),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const HowItWorks())));
                        Navigator.pushNamed(context, '/howItWorks');
                      },
                      child: const HomePageBottomCard('How It Works')),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const SizingGuide())));
                        Navigator.pushNamed(context, '/sizingGuide');
                      },
                      child: const HomePageBottomCard('Sizing Guide')),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
