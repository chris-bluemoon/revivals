import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unearthed/models/dress.dart';

class FirestoreService {

  static final ref = FirebaseFirestore.instance
    .collection('dress')
    .withConverter(
      fromFirestore: Dress.fromFirestore, 
      toFirestore: (Dress d, _) => d.toFirestore()
  );

  // add a new dress
  static Future<void> addDress(Dress dress) async {
    await ref.doc(dress.id).set(dress);
  }

  // get dress once
  static Future<QuerySnapshot<Dress>> getDressesOnce() {
    return ref.get();
  }

}