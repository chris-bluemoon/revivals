import 'package:firebase_auth/firebase_auth.dart';

Future getCurrentUserToDelete() async {
User? _user = await FirebaseAuth.instance.currentUser;
// print("User: ${_user.displayName ?? "None"}");
return _user;}