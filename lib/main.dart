import 'package:flutter/material.dart';
import 'package:unearthed/screens/home_page.dart';
import 'package:unearthed/services/dress_store.dart';
import 'package:unearthed/theme.dart';
import 'package:provider/provider.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool loggedIn = false;
void main() async {

  // Firebase initialize  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create: (context) => DressStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home: HomePage(),
    ),
  ));
}
//   runApp(MaterialApp(
//     theme: primaryTheme,
//     // home: HomePage(),
//     routes: {
//       // When navigating to the "/" route, build the FirstScreen widget.
//       '/': (context) => HomePage(),
//       // When navigating to the "/second" route, build the SecondScreen widget.
//       '/profile': (context) => const Profile(),
//       '/browse': (context) => const Profile(),
//       '/account': (context) => const Profile(),
//       '/new_arrivals': (context) => const NewArrivals(),
//   },
//   ));
// }

// sandbox
class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('sandbox')
    );
  }
}

