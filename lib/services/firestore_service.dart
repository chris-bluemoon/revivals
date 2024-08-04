import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/models/dress_renter.dart';

class FirestoreService {

  static final refDress = FirebaseFirestore.instance
    .collection('dress')
    .withConverter(
      fromFirestore: Dress.fromFirestore, 
      toFirestore: (Dress d, _) => d.toFirestore()
  );

  static final refRenter = FirebaseFirestore.instance
    .collection('renter')
    .withConverter(
      fromFirestore: Renter.fromFirestore, 
      toFirestore: (Renter d, _) => d.toFirestore()
  );

  static final refDressRenter = FirebaseFirestore.instance
    .collection('dressRenter')
    .withConverter(
      fromFirestore: DressRenter.fromFirestore, 
      toFirestore: (DressRenter d, _) => d.toFirestore()
  );

  // add a new dress
  static Future<void> addDress(Dress dress) async {
    await refDress.doc(dress.id).set(dress);
  }

  // get dress once
  static Future<QuerySnapshot<Dress>> getDressesOnce() {
    return refDress.get();
  }

  // add a new renter
  static Future<void> addRenter(Renter renter) async {
    await refRenter.doc(renter.id).set(renter);
  }

  // add a new renter
  static Future<void> updateRenter(Renter renter) async {
    await refRenter.doc(renter.id).update(
      {
        'address': renter.address
      }
    );
    log('Shoudl have changed address to: ${renter.address}');
  }

  // get renters once
  static Future<QuerySnapshot<Renter>> getRentersOnce() {
    return refRenter.get();
  }

  // add a new renterDress
  static Future<void> addDressRenter(DressRenter dressRenter) async {
    await refDressRenter.doc(dressRenter.id).set(dressRenter);
  }

  // get dressRenters once
  static Future<QuerySnapshot<DressRenter>> getDressRentersOnce() {
    return refDressRenter.get();
  }
}