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
                      // return FittedBox(
                        
                        return Image.asset(setDressImage(), fit: BoxFit.contain);
                        // child: Image.asset(setDressImage(),),
                        // fit: BoxFit.fill,
                      // );

  }
}
