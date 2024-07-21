import 'package:flutter/material.dart';
import 'package:unearthed/screens/home_page.dart';
import 'package:unearthed/screens/new_arrivals/new_arrivals.dart';
import 'package:unearthed/screens/profile/profile.dart';
import 'package:unearthed/theme.dart';

void main() {
  runApp(MaterialApp(
    theme: primaryTheme,
    // home: HomePage(),
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => HomePage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/profile': (context) => const Profile(),
      '/browse': (context) => const Profile(),
      '/account': (context) => const Profile(),
      '/new_arrivals': (context) => const NewArrivals(),
  },
  ));
}

// sandbox
class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('sandbox')
    );
  }
}

