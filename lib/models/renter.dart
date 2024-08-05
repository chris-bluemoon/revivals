import 'package:cloud_firestore/cloud_firestore.dart';

class Renter {
  
  Renter({required this.id, 
          required this.email, 
          required this.name, 
          required this.size, 
          required this.address, 
          required this.phoneNum,
        }); 

    String id;
    String email;
    String name;
    int size;
    String address;
    String phoneNum;

  // dress to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'name': name,
      'size': size,
      'address': address,
      'phoneNum': phoneNum,
    };
  }

  // character from firestore
  factory Renter.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {

    // get data from snapshot
    final data = snapshot.data()!;

    // make character instance
    Renter renter = Renter(
      id: snapshot.id,
      email: data['email'],
      name: data['name'],
      size: data['size'],
      address: data['address'],
      phoneNum: data['phoneNum'],
    );

    return renter;
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