import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';

class HygienePolicy extends StatelessWidget {
  const HygienePolicy({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: width * 0.15,
        title: const StyledTitle("Our Hygiene Policy"),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: width*0.06),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () =>
        //           {Navigator.of(context).popUntil((route) => route.isFirst)},
        //       icon: Icon(Icons.close, size: width*0.06)),
        // ],
      ),
      body: const Column(
        children: [
          Text('How it works')
        ],
      )
    );
  }
}