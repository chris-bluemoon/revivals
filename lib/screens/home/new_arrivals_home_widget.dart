import 'package:flutter/material.dart';
import 'package:unearthed/screens/new_arrivals/new_arrivals.dart';
import 'package:unearthed/shared/styled_text.dart';

class NewArrivalsHomeWidget extends StatelessWidget {
  const NewArrivalsHomeWidget({super.key});



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          GestureDetector(
            child: Image.asset('assets/img/backgrounds/new_arrivals_home_page_image.jpg'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const NewArrivals())));
            }
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // StyledHeading('SOPHISCATED'),
                  // StyledHeading('STAPLES'),
                  const StyledBody('SOPHISTICATED'),
                  const StyledBody('STAPLES'),
                  const SizedBox(height: 20),
                  const StyledBody('Rent from our wide'),
                  const StyledBody('selection styles'),
                  const SizedBox(height: 60),
                  Row(
                    children: [
                      SizedBox(width: width*0.57),
                      const SizedBox(
                        // width: width * 0.35,
                        // height: 32.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: StyledBody('FIND OUT MORE', color: Colors.white, weight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
