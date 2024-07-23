import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';

class NewArrivalsHomeWidget extends StatelessWidget {
  const NewArrivalsHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Image.asset('assets/img/backgrounds/new_arrivals_home_page_image.jpg'),
          const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeading('SOPHISCATED'),
                  StyledHeading('STAPLES'),
                  SizedBox(height: 20),
                  StyledBody('Rent from our wide'),
                  StyledBody('selection styles'),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 118.0,
                    height: 32.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('FIND OUT MORE', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
