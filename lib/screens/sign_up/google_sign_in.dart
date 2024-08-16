import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  ValueNotifier userCredential = ValueNotifier('');

  late bool found = false;
  bool userLoggedIn = false;

  void handleSubmit(String email, String name) {
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
      phoneNum: '',
      favourites: [''],
    ));
    log('Assigning user');
    userLoggedIn = true;
    Provider.of<ItemStore>(context, listen: false).assignUser(Renter(
      id: jointUuid,
      email: email,
      name: name,
      size: 0,
      address: '',
      phoneNum: '',
      favourites: [''],
    ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LOGIN', style: TextStyle(fontSize: 22, color: Colors.black)),
            leading: IconButton(
    icon: const Icon(Icons.home_outlined, color: Colors.black),
    onPressed: () => Navigator.of(context)..popUntil((route) => route.isFirst)
    // onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const HomePage())))
  )),
        body: Column(
          children: [
            const SizedBox(height: 200),
            ValueListenableBuilder(
                valueListenable: userCredential,
                builder: (context, value, child) {
                  return (userCredential.value == '' ||
                          userCredential.value == null)
                      ? Center(
                        child: Column(
                          children: [
                            SignInButton(
                              Buttons.AppleDark,
                              onPressed: () async {
                                log('Apple Login');
                                userCredential.value = await signInWithGoogle();
                                if (userCredential.value != null) {
                                  log(userCredential.value.user!.email);
                                  log(userCredential.value.user!.displayName);
                                  handleSubmit(userCredential.value.user!.email,
                                              userCredential.value.user!.displayName);
                                }
                              },
                            ),
                            SignInButton(
                              Buttons.GoogleDark,
                              onPressed: () async {
                                log('Google Login');
                                userCredential.value = await signInWithGoogle();
                                if (userCredential.value != null) {
                                  log(userCredential.value.user!.email);
                                  log(userCredential.value.user!.displayName);
                                  handleSubmit(userCredential.value.user!.email,
                                              userCredential.value.user!.displayName);
                                }
                              },
                            ),
                          ],
                        ),
                      )
                      : Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1.5, color: Colors.black54)),
                              child: Image.network(
                                  userCredential.value.user!.photoURL.toString()),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(userCredential.value.user!.displayName
                                .toString()),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(userCredential.value.user!.email.toString()),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      );
                }),
          ],
        ),
        floatingActionButton: userLoggedIn ? FloatingActionButton.extended(
          
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          onPressed: () async {
            bool result = await signOutFromGoogle();
            Provider.of<ItemStore>(context, listen: false).setLoggedIn(false);
            if (result) {
            userCredential.value = '';}
            Provider.of<ItemStore>(context, listen: false).setLoggedIn(false);
          }, 
          label: const Text('LOG OUT'),
          icon: const Icon(Icons.logout_outlined),
          shape: RoundedRectangleBorder(side: const BorderSide(width: 1,color: Colors.black),borderRadius: BorderRadius.circular(5)),
          ) : null,
        );
  }}

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
      log('exception->$e');
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }