import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sign in to Brew Crew')
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: ElevatedButton(
          child: const Text('Sign In Anon'),
          onPressed: () async {
            log('Sign in Anon pressed');
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              log('Error signing in');
            } else {
              log('Signed in: ${result.id}');
            }
          },)
      )
    );
  }
}