import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

import 'package:unearthed/screens/home/my_app_client.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  ValueNotifier userCredential = ValueNotifier('');
  final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  initState() {
    getCurrentUser();
  // final uid = user.uid;
    super.initState();
  }
  String uname = '----------';

Future<dynamic> getCurrentUser() async {
    User? _user = await FirebaseAuth.instance.currentUser;
// Firebase.Auth.FirebaseUser user = auth.CurrentUser;
    // User? asda = FirebaseAuth.instance.currentUser;
    if (_user != null) {
      log('Setting uname: ${_user.displayName}');
      uname = _user.displayName.toString();
    } else {
      log('Not logged in');
    }
    ;
    return _user;
    // return asda;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('PROFILE')),
        body: ValueListenableBuilder(
            valueListenable: userCredential,
            builder: (context, value, child) {
                final User? user = auth.currentUser;
              return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(user!.displayName!),
                          ElevatedButton(
                              onPressed: () async {
                                bool result = await signOutFromGoogle();
                                if (result) userCredential.value = '';
                              },
                              child: const Text('Logout'))
                        ],
                      ),
                    );
            }));
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