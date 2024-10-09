import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/auth.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/constants.dart';
import 'package:unearthed/shared/loading.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class RegisterPassword extends StatefulWidget {

  const RegisterPassword({required this.email, required this.name, super.key});

  final String email;
  final String name;

  @override
  State<RegisterPassword> createState() => _RegisterPassword();
}

class _RegisterPassword extends State<RegisterPassword> {
  bool found = false;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String password = '';
  bool ready = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final passNotifier = ValueNotifier<PasswordStrength?>(null);

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
        title: const StyledTitle('REGISTER PASSWORD'),
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
              'Create a password (must be more than 6 characters)',
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
                            hintText: 'Password',
                          ),
                          obscureText: true,
                          validator: (val) =>
                              val!.isEmpty ? 'Enter a valid password' : null,
                          onChanged: (value) {
                              passNotifier.value = PasswordStrength.calculate(text: value);
                              password = value;
                              if (PasswordStrength.calculate(text: value) == PasswordStrength.strong) {ready = true;}
                          },
                        ),
                        SizedBox(height: width * 0.01),
                        PasswordStrengthChecker(strength: passNotifier),

                      ],
                    ))),
          ],
        ),
      ),
            bottomNavigationBar: Container(
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
                if (!ready) Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                    },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      side: const BorderSide(width: 1.0, color: Colors.black),
                      ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: StyledHeading('CREATE ACCOUNT', weight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                if (ready) Expanded(
                  child: OutlinedButton(
                                   onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => loading = true);
                    dynamic result =
                        await _auth.registerWithEmailAndPassword(widget.email, password);
                    if (result == null) {
                      setState(() => loading = false);
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                          actions: [
                            // ElevatedButton(
                            // onPressed: () {cancelLogOut(context);},
                            // child: const Text('CANCEL', style: TextStyle(color: Colors.black)),),
                            ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      WidgetStateProperty.all(Colors.white),
                                  backgroundColor:
                                      const WidgetStatePropertyAll<Color>(
                                          Colors.black),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)),
                                          side: BorderSide(
                                              color: Colors.black)))),
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                                // goBack(context);
                              },
                              child: const StyledHeading(
                                'OK',
                                weight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ],
                          backgroundColor: Colors.white,
                          title: const Center(
                              child: StyledHeading("Invalid",
                                  weight: FontWeight.normal)),
                        ),
                      );
                              setState(() {
                                log('Setting password to nothing');
                                _formKey.currentState!.reset();
                              });
                    } else {
                      handleNewLogIn(widget.email, widget.name);
                      log('Popping to first');
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  }
                },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                      side: const BorderSide(width: 1.0, color: Colors.black),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: StyledHeading('CREATE ACCOUNT', color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),   
      // bottomNavigationBar: Container(
      //   // height: 300,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.2),
      //         blurRadius: 10,
      //         spreadRadius: 3,
      //       )
      //     ],
      //   ),
      //   padding: const EdgeInsets.all(10),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         child: OutlinedButton(
      //           onPressed: () async {
      //             if (_formKey.currentState!.validate()) {
      //               setState(() => loading = true);
      //               dynamic result =
      //                   await _auth.registerWithEmailAndPassword(widget.email, password);
      //               if (result == null) {
      //                 setState(() => loading = false);
      //                 showDialog(
      //                   barrierDismissible: false,
      //                   context: context,
      //                   builder: (_) => AlertDialog(
      //                     shape: const RoundedRectangleBorder(
      //                         borderRadius:
      //                             BorderRadius.all(Radius.circular(0))),
      //                     actions: [
      //                       // ElevatedButton(
      //                       // onPressed: () {cancelLogOut(context);},
      //                       // child: const Text('CANCEL', style: TextStyle(color: Colors.black)),),
      //                       ElevatedButton(
      //                         style: ButtonStyle(
      //                             foregroundColor:
      //                                 WidgetStateProperty.all(Colors.white),
      //                             backgroundColor:
      //                                 const WidgetStatePropertyAll<Color>(
      //                                     Colors.black),
      //                             shape: WidgetStateProperty.all<
      //                                     RoundedRectangleBorder>(
      //                                 const RoundedRectangleBorder(
      //                                     borderRadius: BorderRadius.all(
      //                                         Radius.circular(0)),
      //                                     side: BorderSide(
      //                                         color: Colors.black)))),
      //                         onPressed: () {
      //                           setState(() {
      //                             Navigator.pop(context);
      //                           });
      //                           // goBack(context);
      //                         },
      //                         child: const StyledHeading(
      //                           'OK',
      //                           weight: FontWeight.normal,
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                     ],
      //                     backgroundColor: Colors.white,
      //                     title: const Center(
      //                         child: StyledHeading("Invalid",
      //                             weight: FontWeight.normal)),
      //                   ),
      //                 );
      //                         setState(() {
      //                           log('Setting password to nothing');
      //                           _formKey.currentState!.reset();
      //                         });
      //               } else {
      //                 handleNewLogIn(widget.email, widget.name);
      //                 log('Popping to first');
      //                 Navigator.of(context).popUntil((route) => route.isFirst);
      //               }
      //             }
      //           },
      //           style: OutlinedButton.styleFrom(
      //             padding: const EdgeInsets.all(10),
      //             backgroundColor: Colors.black,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(1.0),
      //             ),
      //             side: const BorderSide(width: 1.0, color: Colors.black),
      //           ),
      //           child: const StyledHeading('CREATE ACCOUNT', color: Colors.white),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}