import 'package:flutter/material.dart';
import 'package:unearthed/screens/home/home.dart';
import 'package:unearthed/screens/main_page.dart';
import 'package:unearthed/theme.dart';

void main() {
  runApp(MaterialApp(
    theme: primaryTheme,
    home: HomePage(),
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

