import 'dart:developer';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeumorphismButtonDemo extends StatefulWidget {
  const NeumorphismButtonDemo({super.key});

  @override
  State<NeumorphismButtonDemo> createState() => _NeumorphismButtonDemoState();
}

class _NeumorphismButtonDemoState extends State<NeumorphismButtonDemo> {
  bool isElevated = true;

  @override
  Widget build(BuildContext context) { 
  Offset distance = isElevated ? const Offset(5, 5) : const Offset(10, 10);
  double blur = isElevated ? 15.0 : 20.0;
  log('Button');
      return Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isElevated = !isElevated;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [ 
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: distance,
                    blurRadius: blur,
                    spreadRadius: 1,
                    inset: isElevated,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: -distance,
                    blurRadius: blur,
                    spreadRadius: 1,
                    inset: isElevated,
                  ) 
                ],
              ),
            child: const Icon(
              Icons.home,
              size: 40,
              color: Colors.green
            ),
          ),
        ));
  }
}