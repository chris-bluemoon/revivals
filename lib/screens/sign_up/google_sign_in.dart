import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/styled_text.dart';
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
      countryCode: '+66',
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
      countryCode: '+66',
      phoneNum: '',
      favourites: [''],
    ));
    }
  }

  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('', style: TextStyle(fontSize: 22, color: Colors.black)),
            leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black, size: width*0.06),
    onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst)
    // onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const HomePage())))
  )),
        body: ValueListenableBuilder(
                valueListenable: userCredential,
                builder: (context, value, child) {
                  if (userCredential.value == '' ||
                          userCredential.value == null)
                      { return Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          
                          const SizedBox(height: 200),
                          // SignInButton(
                          //   Buttons.AppleDark,
                          //   onPressed: () async {
                          //     log('Apple Login');
                          //     userCredential.value = await signInWithGoogle();
                          //     if (userCredential.value != null) {
                          //       log(userCredential.value.user!.email);
                          //       log(userCredential.value.user!.displayName);
                          //       handleSubmit(userCredential.value.user!.email,
                          //                   userCredential.value.user!.displayName);
                          //     }
                          //   },
                          // ),
                          // SignInButton(
                          //   Buttons.Facebook,
                          //   onPressed: () async {
                          //     log('FAcebook Login');
                          //     FBLogin().signInWithFacebook();
                          //   },
                          // ),
                          Center(
                            child: SignInButton(
                              Buttons.GoogleDark,
                              onPressed: () async {
                                showDialogue(context);
                                log('Google Login');
                                userCredential.value = await signInWithGoogle();
                                if (userCredential.value != null) {
                                  hideProgressDialogue(context);
                                  log(userCredential.value.user!.email);
                                  log(userCredential.value.user!.displayName);
                                  handleSubmit(userCredential.value.user!.email,
                                              userCredential.value.user!.displayName);
                                  // Navigator.pop(context);
                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))
                              ), 
                                                      actions: [
                            // ElevatedButton(
                              // onPressed: () {cancelLogOut(context);},
                              // child: const Text('CANCEL', style: TextStyle(color: Colors.black)),),
                            ElevatedButton(
                              style: ButtonStyle(
                               backgroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide(color: Colors.black)
                                )
                              )
                            ),
                              onPressed: () {
                                // Navigator.pop(context);
                                Navigator.of(context).popUntil((route) => route.isFirst);
                                // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Profile()));
                              },
                              child: const StyledHeading('OK', weight: FontWeight.normal),
                            ),],
                                                      backgroundColor: Colors.white,
                                                      title: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Flexible(child: Text("Successfully logged in", style: TextStyle(fontSize: 22, color: Colors.black))),
                              Flexible(child: StyledHeading("Successfully logged in", weight: FontWeight.normal)),
                            ],
                                                      ),
                                                    ),
                                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ); } else { 
                        // log('loggin id');
                        return const Text('');
                        // showSuccessfulLogin();
                      }
                },
        ));
  }}

  // showSuccessfulLogin() {

  // }
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

  void showDialogue(BuildContext context){
  showDialog(
  context: context,
  builder: (BuildContext context) => const Loading(),
); 
}

void hideProgressDialogue(BuildContext context) {
Navigator.of(context).pop(const Loading());}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: SpinKitChasingDots(
          color: Colors.black,
          size: 50
        ),
      ),
    );
  }
}

