import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/firestore_service.dart';
import 'package:unearthed/shared/secure_repo.dart';

class ItemStore extends ChangeNotifier {

  final double width = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;

  final List<Item> _items = [];
  final List<Item> _favourites = [];
  final List<Item> _fittings = [];
  // final List<Item> _settings = [];
  final List<Renter> _renters = [];
  final List<ItemRenter> _itemRenters = [];
  Map<String, bool> _sizesFilter = {
    '4': false,
    '6': false,
    '8': false,
    '10': false,
  };
  Map<Color, bool> _coloursFilter = {
    Colors.black: false,
    Colors.white: false,
    Colors.blue: false,
    Colors.green: false,
    Colors.pink: false,
    Colors.grey: false,
    Colors.brown: false,
    Colors.yellow: false,
    Colors.purple: false,
    Colors.red: false,
    Colors.lime: false,
    Colors.cyan: false,
    Colors.teal: false
  };
    Map<String, bool> _lengthsFilter = {
    'mini': false,
    'midi': false,
    'long': false
  };
  Map<String, bool> _printsFilter = {'enthic': false, 'boho': false, 'preppy': false, 'floral' : false, 'abstract': false, 'stripes': false, 'dots': false, 'textured': false, 'none': false};
  Map<String, bool> _sleevesFilter = {'sleeveless': false, 'short sleeve': false, '3/4 sleeve': false, 'long sleeve': false};
  RangeValues _rangeValuesFilter = const RangeValues(0, 10000);

  // final List<bool> _sizesFilter = [true, true, false, false];
  // final List<bool> _sizesFilter = [true, true, false, false];
  // TODO: Revert back to late initialization if get errors with this
  // late final _user;
  Renter _user = Renter(id: '0000', email: 'dummy', name: 'no_user', size: 0, address: '', countryCode: '', phoneNum: '', favourites: [], fittings: [], settings: ['BANGKOK','CM','CM','KG']);
  bool _loggedIn = false;
  // String _region = 'BANGKOK';

  get items => _items;
  get favourites => _favourites;
  get fittings => _fittings;
  get renters => _renters;
  get itemRenters => _itemRenters;
  get renter => _user;
  get loggedIn => _loggedIn;
  get sizesFilter => _sizesFilter;
  get coloursFilter => _coloursFilter;
  get lengthsFilter => _lengthsFilter;
  get printsFilter => _printsFilter;
  get sleevesFilter => _sleevesFilter;
  get rangeValuesFilter => _rangeValuesFilter;
  
  void sizesFilterSetter(sizeF) {
    _sizesFilter = sizeF;
  }
  void coloursFilterSetter(colourF) {
    _coloursFilter = colourF;
  }
  void lengthsFilterSetter(lengthsF) {
    _lengthsFilter = lengthsF;
  }
  void printsFilterSetter(printsF) {
    _printsFilter = printsF;
  }
  void sleevesFilterSetter(sleevesF) {
    _sleevesFilter = sleevesF;
  }
  void rangeValuesFilterSetter(rangeValuesF) {
    _rangeValuesFilter = rangeValuesF;
  }

  void resetFilters() {
    sizesFilter.updateAll((name, value) => value = false);
    rangeValuesFilterSetter(const RangeValues(0,10000));
    coloursFilter.updateAll((name, value) => value = false);
    lengthsFilter.updateAll((name, value) => value = false);
    printsFilter.updateAll((name, value) => value = false);
    sleevesFilter.updateAll((name, value) => value = false);
  }
 

  void addSettings(settings) async {
    _user.settings.add(settings);
    saveRenter(_user);
  }

  // assign the user
  void assignUser(Renter user) async {
    // await FirestoreService.addItem(item);
    _user = user;
    notifyListeners();
  }

  // add character
  void addItem(Item item) async {
    await FirestoreService.addItem(item);
    log('Added item!');
    _items.add(item);
    notifyListeners();
  }

  void addRenter(Renter renter) async {
    await FirestoreService.addRenter(renter);
    _renters.add(renter);
    log(_renters.toString());
    notifyListeners();
  }

  void saveRenter(Renter renter) async {
    log(renter.fittings.toString());
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
    log('Adding ItemRenter ${_itemRenters.length}');
    _itemRenters.add(itemRenter);
    await FirestoreService.addItemRenter(itemRenter);
    notifyListeners();
    log('ItemRenters is now ${_itemRenters.length}');
  }

    // initially fetch items
  void fetchItemsOnce() async {
    // List favs = _user.favourites;
    log('Fethcing Items Once');
    if (items.length == 0) {
      log('Adding Items once');
      // Temporary setting of email password once
      MyStore.writeToStore('fkwx gnet sbwl pgjb');
      final snapshot = await FirestoreService.getItemsOnce();
      for (var doc in snapshot.docs) {
        _items.add(doc.data());
      }

      // And populating tables required by Items
      populateFavourites();
      populateFittings();

      notifyListeners();
      
    }


  }
    void populateFavourites() {
      List favs = _user.favourites;
      _favourites.clear();
      log('CHECKING ITEMS...it has a count ${_items.length}');
      for (Item d in _items) {
        log('COMPARING');
        log(d.toString());
        log(favs.toString());
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
    void populateFittings() {
      List fits = _user.fittings;
      _fittings.clear();
      log(fits.toString());
      for (Item d in _items) {
        if (fits.contains(d.id)) {
          log('Adding a favourite');
          _fittings.add(d);
        }
      }
    }
    void addFitting(item) {
      _fittings.add(item);
      log('Adding fitting');
      notifyListeners();
    }
    void removeFitting(item) {
      _fittings.remove(item);
      log('Removing fitting');
      notifyListeners();
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
      _user = Renter(id: '0000', email: 'dummy', name: 'no_user', size: 0, countryCode: '', address: '', phoneNum: '', favourites: [], fittings: [], settings: ['BANGKOK','CM','CM','KG']);
      log(renter.name);
      notifyListeners();
    }
  }

  // void setRegion(String region) {
  //   log('Set _region to $region');
  //   _region = region;
  //   notifyListeners();
  // }

  void fetchItemRentersOnce() async {
    if (itemRenters.length == 0) {
      final snapshot = await FirestoreService.getItemRentersOnce();
      for (var doc in snapshot.docs) {
        log('Adding an ItemRenter from database');
        _itemRenters.add(doc.data());
      }
      notifyListeners();
    }
  }
  void deleteItemRenters() async {
    if (itemRenters.length > 0) {
      await FirestoreService.deleteItemRenters();
      _itemRenters.clear();
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
    void saveItemRenter(ItemRenter itemRenter) async {
    await FirestoreService.updateItemRenter(itemRenter);
    // _renters[0].aditem = renter.aditem;
      // _user.aditem = renter.aditem;
    notifyListeners();
    return;
  }
}
