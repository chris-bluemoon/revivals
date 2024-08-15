// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/screens/home_page.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/theme.dart';

import 'firebase_options.dart';

void main() async {

  // Firebase initialize  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create: (context) => ItemStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home: const HomePage(),
      // home: EmailComposer(),
    ),
  ));
}

