import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/screens/authenticate/register_password.dart';
import 'package:unearthed/services/auth.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/constants.dart';
import 'package:unearthed/shared/loading.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class RegisterName extends StatefulWidget {

  const RegisterName({required this.email, super.key});

  final String email;

  @override
  State<RegisterName> createState() => _RegisterName();
}

class _RegisterName extends State<RegisterName> {
  bool found = false;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String name = '';
  String error = 'Error: ';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    void handleNewLogIn(String email, String name) {
      log('Adding renter if not exists!');
      Provider.of<ItemStore>(context, listen: false).setLoggedIn(true);
      List<Renter> renters =
          Provider.of<ItemStore>(context, listen: false).renters;
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
          settings: ['BANGKOK', 'CM', 'CM', 'KG'],
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
          settings: ['BANGKOK', 'CM', 'CM', 'KG'],
        ));
      }
    }

    return loading ? const Loading() : Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.2,
        // centerTitle: true,
        title: const StyledTitle('REGISTER NAME'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: width * 0.08),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StyledHeading(
              'Enter your name',
              weight: FontWeight.normal,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Name',
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your name' : null,
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                        ),
                      ],
                    ))),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => (RegisterPassword(email: widget.email, name: name))));
                  }
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  side: const BorderSide(width: 1.0, color: Colors.black),
                ),
                child: const StyledHeading('CONTINUE', color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}