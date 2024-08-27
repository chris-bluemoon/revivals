import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/screens/profile/my_account.dart';
import 'package:unearthed/screens/profile/my_transactions.dart';
import 'package:unearthed/screens/sign_up/google_sign_in.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/shared/whatsapp.dart';

class ProfileLanding extends StatefulWidget {
  const ProfileLanding(this.user, this.signOutFromGoogle, {super.key});

  final User? user;
  final Function() signOutFromGoogle;

  @override
  State<ProfileLanding> createState() => _ProfileLandingState();
}

class _ProfileLandingState extends State<ProfileLanding> {
  Future<void> shareApp() async {
    log('Sharing a link');
    const String appLink = 'https://my google play link';
    const String message = 'Check out my new app $appLink';
    await FlutterShare.share(
        title: 'Share App', text: message, linkUrl: appLink);
  }

  ValueNotifier userCredential = ValueNotifier('');

  cancelLogOut(context) async {
    Navigator.pop(context);
                  }

  goBack(context) async {
                      bool result = await widget.signOutFromGoogle();
                  log('Pressed Exit 1');
                  if (result) {
                    log('awaited result and signed out');
                    userCredential.value = '';
                    Provider.of<ItemStore>(context, listen: false).setLoggedIn(false);
  // setState((context) {});
  // Navigator.pushReplacement<void, void>(
  //   context,
  //   MaterialPageRoute<void>(
  //     builder: (BuildContext context) => const HomePage(),
    // ),
                 Navigator.pop(context);
                 setState(() {});
                  }
                  log('Pressed Exit 2');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,20.0,0,0),
      child: Consumer<ItemStore>(
        builder: (context, value, child) { 
        if (Provider.of<ItemStore>(context, listen: false).loggedIn == true) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledHeading('PERSONAL (${Provider.of<ItemStore>(context, listen: false).renter.name})', weight: FontWeight.bold),
            // Text('PERSONAL (${user!.displayName!})', style: const TextStyle(fontSize: 16)),
            SizedBox(height: width*0.04),
            Row(
              children: [
                SizedBox(width: width*0.01),
                IconButton(
                  onPressed: () {
                    // log('Google user widget.user = ${widget.user!.displayName}');
                    // log('Lets send this user instead = ${widget.user!.displayName}');
                    String userN = Provider.of<ItemStore>(context, listen: false).renter.name;
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => (MyAccount(userN))));
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (MyAccount(widget.user))));
                  },
                  icon: const Icon(Icons.account_circle),
                    iconSize: width*0.05,),
                const StyledBody('MY ACCOUNT'),
              ],
            ),
            Divider(height: width*0.05, indent: 50, color: Colors.grey[200],),
            Row(
              children: [
                SizedBox(width: width*0.01),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const MyTransactions())));
                  },
                  icon: const Icon(Icons.woman_2_outlined),
                    iconSize: width*0.05,),
                const StyledBody('MY BOOKINGS'),
              ],
            ),
            Divider(height: width*0.05, indent: 50, color: Colors.grey[200],),
            // Row(
            //   children: [
            //     SizedBox(width: width*0.01),
            //     IconButton(
            //       onPressed: () {},
            //       icon: Icon(Icons.description)),
            //     Text('INVOICE HISTORY'),
            //   ],
            // ),
            // Divider(height: width*0.05, indent: 50, color: Colors.grey[200],),
            Row(
              children: [
                SizedBox(width: width*0.01),
                IconButton(
                  onPressed: () {
                    shareApp();
                  },
                  icon: const Icon(Icons.group_add),
                    iconSize: width*0.05,),
                const StyledBody('REFER A FRIEND'),
              ],
            ),
            Divider(height: width*0.05, indent: 50, color: Colors.grey[200],),
            // Row(
            //   children: [
            //     SizedBox(width: width*0.01),
            //     IconButton(
            //       onPressed: () {},
            //       icon: Icon(Icons.account_circle)),
            //     Text('NOTIFICATIONS'),
            //   ],
            // ),
            // Divider(height: width*0.05, indent: 50, color: Colors.grey[200],),
            // Consumer<ItemStore>(
            //         // child not required
            //         builder: (context, value, child) {           
            //         if (Provider.of<ItemStore>(context, listen: false).loggedIn == true) {
            //         return const Text('I AM LOGGED IN');
            //         } else {
            //           return const Text('I AM NOT LOGGED IN');
            //         }
            //         },
            // ),
        
        
        
             Row(
              children: [
                SizedBox(width: width*0.01),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                    iconSize: width*0.05,),
                const StyledBody('SETTINGS'),
              ],
            ),
        
            SizedBox(height: width*0.06),
            const StyledHeading('SUPPORT', weight: FontWeight.bold),
            SizedBox(height: width*0.04),
            Row(
              children: [
                SizedBox(width: width*0.01),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle),
                    iconSize: width*0.05,),
                const StyledBody('FAQ'),
              ],
            ),
            Divider(height: width*0.05, indent: 50, color: Colors.grey[200],),
             Row(
              children: [
                SizedBox(width: width*0.01),
                IconButton(
                  onPressed: () {
                    log('Pressed Chat With Us');
                    chatWithUsMessage(context);},
                  icon: const Icon(Icons.chat_bubble_rounded),
                    iconSize: width*0.05,
                  ),
                const StyledBody('CHAT WITH US'),
              ],
            ),
            Divider(height: width*0.05, 
              indent: 50,
              color: Colors.grey[200],
            ),
            Row(
              children: [
                SizedBox(width: width*0.01),
                IconButton(
                    onPressed: () => showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => AlertDialog(
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
                                 setState(() {});
                                 goBack(context);},
                                child: const Text('OK', style: TextStyle(color: Colors.black)),
                              ),],
                            backgroundColor: Colors.white,
                            title: const Center(child: StyledHeading("Successfully logged out")),
                          ),
                        ),
                  
                  icon: const Icon(Icons.exit_to_app),
                  iconSize: width*0.05,),
                const StyledBody('SIGN OUT'),
              ],
            ),
          ],
       );} else {
        return Row(
              children: [
                SizedBox(width: width*0.01),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const GoogleSignInScreen())));
                  },
                  icon: const Icon(Icons.login_outlined),
                  iconSize: width*0.05,
                ),
                const StyledBody('SIGN IN'),
              ],
            );
       }

      }
      ),
    );
  }
}

  // Send a Whatsapp
void chatWithUsMessage(BuildContext context) async {
      log('Tapped whatsapp send');
      try {
        await openWhatsApp(
          phone: '+65 91682725',
          text: 'Hello Unearthed Support...',
        );
      } on Exception catch (e) {
        showDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text("Attention"),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(e.toString()
              ),
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          )
        );
      }
}

showAlertDialog(BuildContext context) {  
  // Create button  
  Widget okButton = ElevatedButton(  
    child: const Center(child: Text("OK")),  
    onPressed: () {  
      // Navigator.of(context).pop();  
      log("Should be about to pop to first");
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

showAlertDialog2(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () { },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("My title"),
    content: const Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
  


