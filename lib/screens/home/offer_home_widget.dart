import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unearthed/shared/styled_text.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
                      return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.white),
                      // child: StyledHeading('text $i'));
                      child: Stack(
                        children: [
                          Image.asset('assets/img/backgrounds/carousel_image_1.jpg'),
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                StyledHeadingPlayFair('Limited Time Offer'),
                                StyledTitlePlayFair('90\$ OFF'),
                                SizedBox(height: 21),
                                StyledBody('Enjoy 6 new styles'),
                                StyledBody('every month'),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: 118.0,
                                  height: 32.0,
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Use code JUL24'),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ),
                        ],
                      )
                      // child: Image.asset('assets/img/items/LEXI_Dione_Item.webp'),
                      // child: Image.asset('assets/img/backgrounds/carousel_image_1.jpg'),
                      );

  }
}
