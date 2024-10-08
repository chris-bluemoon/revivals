import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/auth.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({required this.toggleView, super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  bool found = false;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
      void handleNewLogIn(String email, String name) {
    log('Adding renter if not exists!');
    Provider.of<ItemStore>(context, listen: false).setLoggedIn(true);
    List<Renter> renters = Provider.of<ItemStore>(context, listen: false).renters;
    log('Current Provider of renters list is: ${renters.toString()}');
    for (Renter r in renters) {
      if (r.email == email) {
        found = true;
        log('User ${r.email} already found, not adding');
        Provider.of<ItemStore>(context, listen: false).setCurrentUser();
        break; // fixed this
      } else {
        found = false;
      }
    }
    if (found == false) {
    log('Adding user to DB for first time');
    String jointUuid = uuid.v4();
    Provider.of<ItemStore>(context, listen: false).addRenter(Renter(
      id: jointUuid,
      email: email,
      name: name,
      size: 0,
      address: '',
      countryCode: '+66',
      phoneNum: '',
      favourites: [''],
      settings: ['BANGKOK','CM','CM','KG'],
    ));
    log('Assigning user');
    // userLoggedIn = true;
    Provider.of<ItemStore>(context, listen: false).assignUser(Renter(
      id: jointUuid,
      email: email,
      name: name,
      size: 0,
      address: '',
      countryCode: '+66',
      phoneNum: '',
      favourites: [''],
      settings: ['BANGKOK','CM','CM','KG'],
    ));
    }
  }
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Register with Brew Crew'),
        actions: [
          IconButton(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: const Icon(Icons.person),
            tooltip: 'register'
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget> [
              const SizedBox(height: 20),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (val) => val!.length < 6 ? 'Enter a password at least 6 chars long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                }
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Register'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() => error = 'Error registering');
                    } else {
                      log('Popping to first');
                      handleNewLogIn(email, password); 
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  }
                }
              ),
              const SizedBox(height: 30),
              Text(error),
            ],
          )
      )
    ));
  }
}