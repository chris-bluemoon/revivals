import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/renter.dart';
import 'dart:developer';
import 'package:unearthed/screens/profile/profile_landing.dart';
import 'package:unearthed/services/class_store.dart';

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
    List<Renter> renters = Provider.of<ItemStore>(context, listen: false).renters;
    log('Renters in Provider DB now:');
    log(renters.length.toString());
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
      // Insert user to Provider here?
    } else {
      log('Not logged in');
      signInWithGoogle();
    }
    ;
    return _user;
    // return asda;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        // centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('PROFILE', style: TextStyle(fontSize: 22))
              ]),
      ),
        body: ValueListenableBuilder(
            valueListenable: userCredential,
            builder: (context, value, child) {
              final User? user = auth.currentUser;
              return ProfileLanding(user, signOutFromGoogle);
            }));
  }

}

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

showAlertDialog(BuildContext context) {  
  // Create button  
  Widget okButton = ElevatedButton(  
    child: const Center(child: Text("OK")),  
    onPressed: () {  
      // Navigator.of(context).pop();  
      Navigator.of(context).popUntil((route) => route.isFirst);
    },  
  ); 
    // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: const Center(child: Text("SIGNED OUT")),
    // content: Text("      Your item is being prepared"),  
    actions: [  
      okButton,  
    ],  
                shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
  );  
    showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );
}