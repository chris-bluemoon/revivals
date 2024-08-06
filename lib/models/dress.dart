import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

List<Dress> myDresses = [
Dress(id: '-', name: 'Imory', brand: 'BARDOT', colour: 'Biege-Nude', size: 8, rentPrice: 2500, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Carmelita', brand: 'HOUSE OF CB', colour: 'Biege-Nude', size: 6, rentPrice: 900, rrp: 8500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Laetitia', brand: 'HOUSE OF CB', colour: 'Biege-Nude', size: 8, rentPrice: 900, rrp: 7500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Rafaela', brand: 'HOUSE OF CB', colour: 'Biege-Nude', size: 6, rentPrice: 1600, rrp: 10000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Riley', brand: 'LEXI', colour: 'Biege-Nude', size: 8, rentPrice: 1500, rrp: 11000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Cartellina', brand: 'BARDOT', colour: 'Black', size: 8, rentPrice: 1200, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Hayden', brand: 'BARDOT', colour: 'Black', size: 8, rentPrice: 900, rrp: 5500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Ira', brand: 'BARDOT', colour: 'Black', size: 8, rentPrice: 1200, rrp: 9200, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Wyatt', brand: 'BARDOT', colour: 'Black', size: 8, rentPrice: 2500, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Elinor', brand: 'ELIYA', colour: 'Black', size: 8, rentPrice: 3200, rrp: 14000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Flavia', brand: 'LEXI', colour: 'Black', size: 6, rentPrice: 1000, rrp: 8000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Maya', brand: 'LEXI', colour: 'Black', size: 8, rentPrice: 2500, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Violette', brand: 'AJE', colour: 'Blue', size: 8, rentPrice: 3000, rrp: 19000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Delfina', brand: 'ALC', colour: 'Blue', size: 8, rentPrice: 2300, rrp: 25300, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Georgette', brand: 'HOUSE OF CB', colour: 'Blue', size: 6, rentPrice: 1500, rrp: 9000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Imogen', brand: 'HOUSE OF CB', colour: 'Blue', size: 8, rentPrice: 1000, rrp: 8300, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Salome', brand: 'HOUSE OF CB', colour: 'Blue', size: 8, rentPrice: 1200, rrp: 8300, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Isadora', brand: 'LEXI', colour: 'Blue', size: 6, rentPrice: 800, rrp: 6500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Polkadot', brand: 'ZIMMERMANN', colour: 'Blue', size: 8, rentPrice: 2900, rrp: 62000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Paradiso', brand: 'AJE', colour: 'Floral Print', size: 4, rentPrice: 3500, rrp: 29000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Olea', brand: 'BARDOT', colour: 'Floral Print', size: 6, rentPrice: 700, rrp: 6000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Francesca', brand: 'ELIYA', colour: 'Floral Print', size: 6, rentPrice: 3000, rrp: 13000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Carmen', brand: 'HOUSE OF CB', colour: 'Floral Print', size: 6, rentPrice: 900, rrp: 7000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Sheena', brand: 'LEXI', colour: 'Floral Print', size: 6, rentPrice: 1200, rrp: 9000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Lola', brand: 'NADINE MERABI', colour: 'Floral Print', size: 8, rentPrice: 2100, rrp: 23000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Aribella', brand: 'REFORMATION', colour: 'Floral Print', size: 8, rentPrice: 1200, rrp: 11000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Anais', brand: 'ROCOCO SAND', colour: 'Floral Print', size: 8, rentPrice: 2200, rrp: 20000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: 'Lamour', brand: 'SELKIE', colour: 'Floral Print', size: 6, rentPrice: 1800, rrp: 9500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  // No images found
  Dress(id: '-', name: "Kiss On The Lips", brand: 'SELKIE', colour: 'Floral Print', size: 6, rentPrice: 1800, rrp: 9500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Cosmic", brand: 'ZIMMERMANN', colour: 'Floral Print', size: 8, rentPrice: 3500, rrp: 45000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Applique", brand: 'ZIMMERMANN', colour: 'Floral Print', size: 8, rentPrice: 3000, rrp: 35000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Carla", brand: 'ELIYA', colour: 'Gold', size: 6, rentPrice: 3000, rrp: 13500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  // Not sure what this is
  // Dress(id: '-', name: "Gold", brand: 'UNEARTHED COLLECTIONS', colour: 'Gold', size: 8, rentPrice: 1500, rrp: 8000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Faye", brand: 'HOUSE OF CB', colour: 'Green', size: 6, rentPrice: 1300, rrp: 9000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Mathilde", brand: 'AJE', colour: 'Pink', size: 4, rentPrice: 3000, rrp: 16000, description: 'Aje The Mathilde Bubble Hem Midi DressS', bust: '', waist: '', hips: '', longDescription: 'The Mathilde Bubble Hem Midi Dress features pleating through to the drop waist and a voluminous bubble neckline and skirt. A statement style for any occasion, wear with your favourite Aje heel.', isFav: false),
  Dress(id: '-', name: "Tidal", brand: 'AJE', colour: 'Pink', size: 4, rentPrice: 3000, rrp: 13500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Ribera", brand: 'BAOBAB', colour: 'Pink', size: 6, rentPrice: 1600, rrp: 12000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Farah", brand: 'BRONX AND BANCO', colour: 'Pink', size: 8, rentPrice: 3700, rrp: 32000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Genevieve", brand: 'HOUSE OF CB', colour: 'Pink', size: 6, rentPrice: 2000, rrp: 10000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Tuxedo", brand: 'ZIMMERMANN', colour: 'Pink', size: 8, rentPrice: 3000, rrp: 35000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Esme", brand: 'ELIYA', colour: 'Red', size: 6, rentPrice: 3000, rrp: 14000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Candice", brand: 'NADINE MERABI', colour: 'Red', size: 8, rentPrice: 1900, rrp: 13000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Flor", brand: 'REFORMATION', colour: 'Red', size: 6, rentPrice: 1200, rrp: 12900, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Socorro", brand: 'HOUSE OF CB', colour: 'Silver', size: 6, rentPrice: 1000, rrp: 8200, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Elia", brand: 'HOUSE OF CB', colour: 'White', size: 6, rentPrice: 1000, rrp: 7000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Belinda", brand: 'LEXI', colour: 'White', size: 8, rentPrice: 1500, rrp: 10000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
  Dress(id: '-', name: "Odessey", brand: 'ZIMMERMANN', colour: 'White', size: 6, rentPrice: 5000, rrp: 53000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', isFav: false),
];

class Dress {
  
  Dress({required this.id, 
          required this.name, 
          required this.brand, 
          required this.colour, 
          required this.size, 
          required this.rentPrice, 
          required this.rrp,
          required this.description,
          required this.bust,
          required this.waist,
          required this.hips,
          required this.longDescription,
          required this.isFav,
        });

    String id;
    String name;
    String brand;
    String colour;
    int size;
    int rentPrice;
    int rrp;
    String description;
    String bust;
    String waist;
    String hips;
    String longDescription;
    bool isFav;
    


  // dress to firestore (map, bust: '', waist: '', hips: '', isFav: false)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'brand': brand,
      'colour': colour,
      'size': size,
      'rentPrice': rentPrice,
      'rrp': rrp,
      'description': description,
      'bust': bust,
      'waist': waist,
      'hips': hips,
      'longDescription': longDescription,
      'isFav': isFav,
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
      colour: data['colour'],
      size: data['size'],
      rentPrice: data['rentPrice'],
      rrp: data['rrp'],
      description: data['description'],
      bust: data['bust'],
      waist: data['waist'],
      hips: data['hips'],
      longDescription: data['longDescription'],
      isFav: data['isFav']
    );

    return dress;
  } 
  
  
}
