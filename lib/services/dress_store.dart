import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/services/firestore_service.dart';

class DressStore extends ChangeNotifier {

  final List<Dress> _dresses = [];
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

  // add dress
  // void addCharacter(Dress dress) {
  //   _dresses.add(dress);
  //   notifyListeners();
  // }

  // add character
  void addDress(Dress dress) async {
    log('Adding dress');
    await FirestoreService.addDress(dress);

    _dresses.add(dress);
    notifyListeners();
  }

    // initially fetch dresses
  void fetchDressesOnce() async {
    log('Dresses list size is ${_dresses.length}');
    if (dresses.length == 0) {
      final snapshot = await FirestoreService.getDressesOnce();
      log('Getting dresses once from Firestore');
      for (var doc in snapshot.docs) {
        _dresses.add(doc.data());
      }

      notifyListeners();
    }
  }

}