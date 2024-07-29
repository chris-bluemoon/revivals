import 'package:cloud_firestore/cloud_firestore.dart';

class DressRenter {
  
  DressRenter({required this.id, 
          required this.renterId, 
          required this.dressId, 
          required this.startDate, 
          required this.endDate, 
          required this.price,
        }); 

    String id;
    String renterId;
    String dressId;
    String startDate;
    String endDate;
    int price;

  // dress to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'renterId': renterId,
      'dressId': dressId,
      'startDate': startDate,
      'endDate': endDate,
      'price': price,
    };
  }

  // DressRenter from firestore
  factory DressRenter.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {

    // get data from snapshot
    final data = snapshot.data()!;

    // make character instance
    DressRenter dressRenter = DressRenter(
      id: snapshot.id,
      renterId: data['renterId'],
      dressId: data['dressId'],
      startDate: data['startDate'],
      endDate: data['endDate'],
      price: data['price'],
    );

    return dressRenter;
  } 
  
  
}

// List<Dress> dresses = [
//   Dress(id: 1, name: 'Mathilde Bubble', brand: 'AJE', size: 52, rentPrice: 1200, rrp: 12000, image: 'AJE_Mathilde_Bubble_Dress.webp'),
//   Dress(id: 2, name: 'Carla', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
//   Dress(id: 3, name: 'Elinor', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
//   Dress(id: 4, name: 'Francesca Mini', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
//   Dress(id: 5, name: 'Dione', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
//   Dress(id: 6, name: 'Riley Chiffon', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
//   Dress(id: 7, name: 'Sheena', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
// ];