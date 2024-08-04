import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/models/dress_renter.dart';
import 'package:unearthed/services/firestore_service.dart';

class DressStore extends ChangeNotifier {

  final List<Dress> _dresses = [];
  final List<Renter> _renters = [];
  final List<DressRenter> _dressRenters = [];
  // final List<Dress> _dresses = [
  //   Dress(id: '1', name: 'Mathilde Bubble', brand: 'AJE', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '2', name: 'Carla', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '3', name: 'Elinor', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '4', name: 'Francesca Mini', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '5', name: 'Dione', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '6', name: 'Riley Chiffon', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '7', name: 'Sheena', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000),
  // ];

  get dresses => _dresses;
  get renters => _renters;
  get dressRenters => _dressRenters;

  // add dress
  // void addCharacter(Dress dress) {
  //   _dresses.add(dress);
  //   notifyListeners();
  // }

  // add character
  void addDress(Dress dress) async {
    await FirestoreService.addDress(dress);
    _dresses.add(dress);
    notifyListeners();
  }

  void addRenter(Renter renter) async {
    await FirestoreService.addRenter(renter);
    _renters.add(renter);
    log(_renters.toString());
    notifyListeners();
  }

  void saveRenter(Renter renter) async {
    await FirestoreService.updateRenter(renter);
    return;
  }

  void addRenterAppOnly(Renter renter) {
    _renters.add(renter);
  }
  // add dressRenter
  void addDressRenter(DressRenter dressRenter) async {
    await FirestoreService.addDressRenter(dressRenter);
    _dressRenters.add(dressRenter);
    notifyListeners();
  }

    // initially fetch dresses
  void fetchDressesOnce() async {
    if (dresses.length == 0) {
      final snapshot = await FirestoreService.getDressesOnce();
      for (var doc in snapshot.docs) {
        _dresses.add(doc.data());
      }

      notifyListeners();
    }
  }
  void fetchDressRentersOnce() async {
    if (dressRenters.length == 0) {
      final snapshot = await FirestoreService.getDressRentersOnce();
      for (var doc in snapshot.docs) {
        _dressRenters.add(doc.data());
      }

      notifyListeners();
    }
  }
}