import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/models/dress.dart';

class DressWidget extends StatefulWidget {
  const DressWidget({super.key, required this.dress, required this.dressNumber});

  final int dressNumber;
  final Dress dress;



  @override
  State<DressWidget> createState() => _DressWidgetState();
}

class _DressWidgetState extends State<DressWidget> {
  
  late String dressName;
  late String brandName;
  late String imageName;

  String setDressImage() {
    dressName = widget.dress.name.replaceAll(RegExp(' +'), '_');
    brandName = widget.dress.brand.replaceAll(RegExp(' +'), '_');
    imageName = 'assets/img/new_dresses/${brandName}_${dressName}_Dress_${widget.dressNumber}.jpg';
    return imageName;
  }

  @override
  Widget build(BuildContext context) {
                      // String dressImage = 'assets/img/new_dresses/${widget.dress.brand}_${widget.dress.name}_Dress_${widget.dressNumber}.jpg';
                      return Container(
                      // width: MediaQuery.of(context).size.width*2,
                      // width: 400,
                      // height: 800,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.white),
                      // child: StyledHeading('text $i'));
                      child: Image.asset(setDressImage(),)
                      
                      
                      // child: Image.asset('assets/img/dresses/LEXI_Dione_Dress.webp'),
                      // child: Image.asset('assets/img/backgrounds/carousel_image_1.jpg'),
                      );

  }
}
