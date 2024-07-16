import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(fontFamily: 'Lovelo'),
      home: const Scaffold(
        body: Center(
          child: Text('unearthed'),
          // child: Text('unearthed', style: TextStyle(fontFamily: 'Lovelo') ),
        ),
      ),
    );
  }
}
