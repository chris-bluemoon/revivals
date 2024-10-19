import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';

class FittingSummary extends StatelessWidget {
  const FittingSummary({required this.dateTime, super.key});

  final Map dateTime;

  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
  return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.2,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledTitle('FITTING SUMMARY'),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: width*0.08),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, width * 0.01, 0),
                child: Icon(Icons.close, size: width*0.06),
              )),
        ],
      ),
    );
  }
}