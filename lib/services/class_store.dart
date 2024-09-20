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
  final List<Item> _settings = [];
  final List<Renter> _renters = [];
  final List<ItemRenter> _itemRenters = [];
  List _filters = []; 
  // TODO: Revert back to late initialization if get errors with this
  // late final _user;
  Renter _user = Renter(id: '0000', email: 'dummy', name: 'no_user', size: 0, address: '', countryCode: '', phoneNum: '', favourites: [], settings: ['BANGKOK','CM','CM','KG']);
  bool _loggedIn = false;
  String _region = 'BANGKOK';

  get items => _items;
  get favourites => _favourites;
  get settings => _settings;
  get renters => _renters;
  get itemRenters => _itemRenters;
  get renter => _user;
  get loggedIn => _loggedIn;
  get region => _region;
  get filters => _filters;

  void loadFilters(filters) {
    Map<String, bool> sizeMap = {
    '4': false,
    '6': false,
    '8': false,
    '10': false,
  };
    filters.add(sizeMap);
  }
  void saveFilters(filters) {
    _filters = filters;
  }

  void addSettings(settings) async {
    _user.settings.add(settings);
    saveRenter(_user);
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
    notifyListeners();
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
      log('Adding Items once');
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
    void addFavourite(item) {
      _favourites.add(item);
      log('Removing favourite');
      notifyListeners();
    }
    void removeFavourite(item) {
      _favourites.remove(item);
      log('Removing favourite');
      notifyListeners();
    }

    void populateSettings() {
      List settingsList = _user.settings;
      _favourites.clear();
      log('Favourties...');
      log(settingsList.toString());
      for (Item d in _items) {
        if (settingsList.contains(d.id)) {
          log('Adding a setting');
          _settings.add(d);
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
      _user = Renter(id: '0000', email: 'dummy', name: 'no_user', size: 0, countryCode: '', address: '', phoneNum: '', favourites: [], settings: ['BANGKOK','CM','CM','KG']);
      log(renter.name);
      notifyListeners();
    }
  }

  void setRegion(String region) {
    log('Set _region to $region');
    _region = region;
    notifyListeners();
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
