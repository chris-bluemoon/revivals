import 'package:cloud_firestore/cloud_firestore.dart';

class Renter {
  
  Renter({required this.id, 
          required this.email, 
          required this.name, 
          required this.size, 
          required this.address, 
          required this.countryCode,
          required this.phoneNum,
          required this.favourites,
        }); 

    String id;
    String email;
    String name;
    int size;
    String address;
    String countryCode;
    String phoneNum;
    List favourites;

  // item to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'name': name,
      'size': size,
      'address': address,
      'countryCode': countryCode,
      'phoneNum': phoneNum,
      'favourites': favourites,
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
      countryCode: data['countryCode'],
      phoneNum: data['phoneNum'],
      favourites: data['favourites'],
    );

    return renter;
  } 
  
  
}

// List<Item> items = [
//   Item(id: 1, name: 'Mathilde Bubble', brand: 'AJE', size: 52, rentPrice: 1200, rrp: 12000, image: 'AJE_Mathilde_Bubble_Item.webp'),
//   Item(id: 2, name: 'Carla', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000, image: '3_item.jpg'),
//   Item(id: 3, name: 'Elinor', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000, image: '3_item.jpg'),
//   Item(id: 4, name: 'Francesca Mini', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000, image: '3_item.jpg'),
//   Item(id: 5, name: 'Dione', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000, image: '3_item.jpg'),
//   Item(id: 6, name: 'Riley Chiffon', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000, image: '3_item.jpg'),
//   Item(id: 7, name: 'Sheena', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000, image: '3_item.jpg'),
// ];