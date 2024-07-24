import 'package:cloud_firestore/cloud_firestore.dart';

class Dress {
  
  Dress({required this.id, 
          required this.name, 
          required this.brand, 
          required this.size, 
          required this.rentPrice, 
          required this.rrp
        }); 

    String id;
    String name;
    String brand;
    int size;
    int rentPrice;
    int rrp;
  
  // dress to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'brand': brand,
      'size': size,
      'rentPrice': rentPrice,
      'rrp': rrp
    };
  }

  // character from firestore
  factory Dress.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {

    // get data from snapshot
    final data = snapshot.data()!;

    // make character instance
    Dress dress = Dress(
      id: snapshot.id,
      name: data['name'],
      brand: data['brand'],
      size: data['size'],
      rentPrice: data['rentPrice'],
      rrp: data['rrp']
    );

    return dress;
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