import 'package:flutter/material.dart';

class MyAppBar extends AppBar {

  MyAppBar({super.key, required BuildContext context})
      : super(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/unearthed_logo_2.png',
              fit: BoxFit.contain,
              height: 200,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: Icon(Icons.close)),
        ],
          );
}
