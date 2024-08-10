import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unearthed/screens/home/home.dart';
import 'dart:developer';

import 'package:unearthed/screens/home/my_app_client.dart';
import 'package:unearthed/screens/profile/profile.dart';
import 'package:unearthed/screens/profile/profile_landing.dart';
import 'package:unearthed/screens/profile/my_account.dart';
import 'package:unearthed/shared/send_whatsapp.dart';
import 'package:unearthed/shared/whatsapp.dart';

class AditemForm extends StatefulWidget {
  @override
  _AditemFormState createState() => _AditemFormState();
}

class _AditemFormState extends State<AditemForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text('I agree to the terms and conditions.'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() && _isChecked) {
                  _submitForm();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                    content: Text('Please fill all fields and accept terms.'),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Process the form data (e.g., authenticate user, submit to server)
    // For this example, we'll just print the values
    print('Email: $email');
    print('Password: $password');

    // Clear text fields after submission
    _emailController.clear();
    _passwordController.clear();

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Form submitted successfully.'),
        duration: Duration(seconds: 2),
      ),
    );
  }
  }