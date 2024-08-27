import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/item_card.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  bool anyFavourites = true;

  @override
  initState() {
    Provider.of<ItemStore>(context, listen: false).populateFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ItemStore>(context, listen: false).favourites.length > 0) {
      anyFavourites = true;
    } else {
      anyFavourites = false;
    }
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Row(
            // TODO: Image is not centered in appbar with back arrow
            mainAxisAlignment: MainAxisAlignment.center,
            children: [StyledTitle('WISH LIST')]),
      ),
      body: anyFavourites ? Container(
          color: Colors.white,
          child: Consumer<ItemStore>(
              // child not required
              builder: (context, value, child) {return 
                GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.5),
                  itemBuilder: (_, index) => GestureDetector(
                      child: ItemCard(value.favourites[index]),
                      onTap: () {
                        // if (Provider.of<ItemStore>(context, listen: false).renters.length == 0) {
                        // log('Not logged in, cannot rent, redirecting');
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (GoogleSignInScreen())));
                        // } else {
                        // log('About to rent ${value.items[index].name}');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                (ToRent(value.favourites[index]))));
                        // }
                      }),
                  itemCount: value.favourites.length,
    );})
    ) : Container(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No favourites yet', style: TextStyle(fontSize: 22),),
          ],
        )
      ],)
    )
    );
  }
}
