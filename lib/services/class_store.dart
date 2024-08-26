import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/firestore_service.dart';
import 'package:unearthed/shared/secure_repo.dart';

class ItemStore extends ChangeNotifier {

  final List<Item> _items = [];
  final List<Item> _favourites = [];
  final List<Renter> _renters = [];
  final List<ItemRenter> _itemRenters = [];
  // TODO: Revert back to late initialization if get errors with this
  // late final _user;
  Renter _user = Renter(id: '0000', email: 'dummy', name: 'no_user', size: 0, address: '', phoneNum: '', favourites: []);
  bool _loggedIn = false;
  // final List<Item> _Items = [
  //   Item(id: '1', name: 'Mathilde Bubble', brand: 'AJE', size: 52, rentPrice: 1200, rrp: 12000),
  //   Item(id: '2', name: 'Carla', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000),
  //   Item(id: '3', name: 'Elinor', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000),
  //   Item(id: '4', name: 'Francesca Mini', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000),
  //   Item(id: '5', name: 'Dione', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000),
  //   Item(id: '6', name: 'Riley Chiffon', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000),
  //   Item(id: '7', name: 'Sheena', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000),
  // ];

  get items => _items;
  get favourites => _favourites;
  get renters => _renters;
  get itemRenters => _itemRenters;
  get renter => _user;
  get loggedIn => _loggedIn;

  // add item
  // void addCharacter(Item item) {
  //   _Items.add(item);
  //   notifyListeners();
  // }
  // void setLoggedIn(loggedIn) {
  //   _loggedIn = loggedIn;
  // }

  void addFavourite(Item item) async {
    // await FirestoreService.addItem(item);
    _favourites.add(item);
    notifyListeners();
  }

  void addFavourite2(Item item) async {
    _user.favourites.add(item.id);
    saveRenter(_user);
    log('New user with favourite added:');
    log(_user.favourites.toString());
    log('Showing user id');
    log(_user.id);
  }

  // void addAllFavourites() {
  //   Item d;
  //   log('_Items size is: ${_Items.length}');
  //   for (d in _Items) {
  //     if (d.isFav == true) {
  //       _favourites.add(d);
  //     }

  //   }
  // }

  // assign the user
  void assignUser(Renter user) async {
    // await FirestoreService.addItem(item);
    _user = user;
    notifyListeners();
  }


  // // remove the user
  // void unassignUser(Renter user) async {
  //   // await FirestoreService.addItem(item);
  //   _user = null;
  //   notifyListeners();
  // }

  // add character
  void addItem(Item item) async {
    await FirestoreService.addItem(item);
    _items.add(item);
    notifyListeners();
  }

  // add character
  // void toggleItemFav(Item item) async {
  //   log('Updating item with new value: ${item.isFav}');
  //   if (item.isFav == true) {
  //     _favourites.add(item);
  //   } else {
  //     _favourites.remove(item);
  //   }
  //   log('List of favourites');
  //   for (Item d in _favourites) {
  //     log(d.name);
  //   }
  //   await FirestoreService.updateItem(item);
  //   notifyListeners();
  // }

  void addRenter(Renter renter) async {
    await FirestoreService.addRenter(renter);
    _renters.add(renter);
    log(_renters.toString());
    notifyListeners();
  }

  void saveRenter(Renter renter) async {
    await FirestoreService.updateRenter(renter);
    // _renters[0].aditem = renter.aditem;
      // _user.aditem = renter.aditem;
    return;
  }

  void addRenterAppOnly(Renter renter) {
    _renters.add(renter);
  }
  // add itemRenter
  void addItemRenter(ItemRenter itemRenter) async {
    await FirestoreService.addItemRenter(itemRenter);
    _itemRenters.add(itemRenter);
    notifyListeners();
  }

    // initially fetch items
  void fetchItemsOnce() async {
    // List favs = _user.favourites;
    if (items.length == 0) {
      // Temporary setting of email password once
      MyStore.writeToStore('fkwx gnet sbwl pgjb');
      final snapshot = await FirestoreService.getItemsOnce();
      for (var doc in snapshot.docs) {
        _items.add(doc.data());
      }

      notifyListeners();
      
    }


  }
    void populateFavourites() {
      List favs = _user.favourites;
      _favourites.clear();
      log('Favourties...');
      log(favs.toString());
      for (Item d in _items) {
        if (favs.contains(d.id)) {
          log('Adding a favourite');
          _favourites.add(d);
        }
      }
    }
  // initially fetch itemRenters
      Future<dynamic> setCurrentUser() async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        List<Renter> renters = this.renters;
        for (Renter r in renters) {
          if (r.email == user.email) {
            assignUser(r);
            log('Setting current user');
            _loggedIn = true;
          }
        }
      } else {
        log('Not logged in');
        _loggedIn = false;
      }
      return user;
      // return asda;
    }
  void setLoggedIn(bool loggedIn) {
    log('Set _loggedIn to $loggedIn');
    _loggedIn = loggedIn;
    if (loggedIn == false) {
      _user = Renter(id: '0000', email: 'dummy', name: 'no_user', size: 0, address: '', phoneNum: '', favourites: []);
      log(renter.name);
      notifyListeners();
    }
  }

  void fetchItemRentersOnce() async {
    if (itemRenters.length == 0) {
      final snapshot = await FirestoreService.getItemRentersOnce();
      for (var doc in snapshot.docs) {
        _itemRenters.add(doc.data());
      }
      notifyListeners();
    }
  }

  // initially fetch renters
  void fetchRentersOnce() async {
    log('fetchRentersOnce is being called');
    log('current length: ${renters.length}');
    if (renters.length == 0) {
      final snapshot = await FirestoreService.getRentersOnce();
      for (var doc in snapshot.docs) {
        log('Adding ${doc.data().email} to _renters');
        _renters.add(doc.data());
        }
      }
      setCurrentUser();
      // log("Renters populated with length ${_renters.length}");
      // notifyListeners();
    }
}
