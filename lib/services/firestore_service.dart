import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/models/renter.dart';

class FirestoreService {

  static final refItem = FirebaseFirestore.instance
    .collection('item')
    .withConverter(
      fromFirestore: Item.fromFirestore, 
      toFirestore: (Item d, _) => d.toFirestore()
  );

  static final refRenter = FirebaseFirestore.instance
    .collection('renter')
    .withConverter(
      fromFirestore: Renter.fromFirestore, 
      toFirestore: (Renter d, _) => d.toFirestore()
  );

  static final refItemRenter = FirebaseFirestore.instance
    .collection('itemRenter')
    .withConverter(
      fromFirestore: ItemRenter.fromFirestore, 
      toFirestore: (ItemRenter d, _) => d.toFirestore()
  );

  // add a new item
  static Future<void> addItem(Item item) async {
    await refItem.doc(item.id).set(item);
  }

  // get item once
  static Future<QuerySnapshot<Item>> getItemsOnce() {
    return refItem.get();
  }

  // add a new renter
  static Future<void> addRenter(Renter renter) async {
    await refRenter.doc(renter.id).set(renter);
  }

  // Update renter
  static Future<void> updateRenter(Renter renter) async {
    await refRenter.doc(renter.id).update(
      {
        'address': renter.address,
        'phoneNum': renter.phoneNum,
        'favourites': renter.favourites,
        'fittings': renter.fittings,
        'settings': renter.settings,
     }
    );
  }

  // Toggle isFav
  // static Future<void> updateItem(Item item) async {
  //   log('Firestore service received item id: ${item.id}');
  //   await refItem.doc(item.id).update(
  //     {
  //       'isFav': item.isFav,
  //     }
  //   );
  // }

  // get renters once
  static Future<QuerySnapshot<Renter>> getRentersOnce() {
    return refRenter.get();
  }

  // add a new renterItem
  static Future<void> addItemRenter(ItemRenter itemRenter) async {
    await refItemRenter.doc(itemRenter.id).set(itemRenter);
  }

  // get itemRenters once
  static Future<QuerySnapshot<ItemRenter>> getItemRentersOnce() {
    return refItemRenter.get();
  }
  // Update itemrenter
  static Future<void> updateItemRenter(ItemRenter itemRenter) async {
    await refItemRenter.doc(itemRenter.id).update(
      {
        'status': itemRenter.status,
     }
    );
  }
  
  static deleteItemRenters() {
  FirebaseFirestore.instance
    .collection('itemRenter').get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        log('DELETED ITEMRENTER');
        ds.reference.delete();
      }
    });
  }
  
}