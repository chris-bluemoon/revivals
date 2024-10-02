import 'package:cloud_firestore/cloud_firestore.dart';

List<Item> allItems = [
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Cartellina', brand: 'BARDOT', colour: ['Black'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1200, buyPrice: 0, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Ira', brand: 'BARDOT', colour: ['Black'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1200, buyPrice: 0, rrp: 9200, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Imory', brand: 'BARDOT', colour: ['Biege-Nude'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 2500, buyPrice: 0, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Carmelita', brand: 'HOUSE OF CB', colour: ['Biege-Nude'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 900, buyPrice: 0, rrp: 8500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Laetitia', brand: 'HOUSE OF CB', colour: ['Biege-Nude'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 900, buyPrice: 0, rrp: 7500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Rafaela', brand: 'HOUSE OF CB', colour: ['Biege-Nude'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1600, buyPrice: 0, rrp: 10000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Riley', brand: 'LEXI', colour: ['White'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1500, buyPrice: 0, rrp: 11000, description: 'Riley One Shoulder Maxi Dress Cream', bust: '33', waist: '25', hips: '37', longDescription: 'The Riley dress is an opulent silhouette, cut from our luxe stretch crepe. With an asymetric hemline and off shoulder train, it is a simple yet elegant option for an evening out. It is fasted with a side zipper and features the signature thigh high split Lexi has become known for. Features: Self lined Stretch Crepe Georgette fabric, Side split, Off shoulder floor length train, Asymmetrical Hem, Side Zip', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Hayden', brand: 'BARDOT', colour: ['Black'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 900, buyPrice: 0, rrp: 5500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Wyatt', brand: 'BARDOT', colour: ['Black'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 2500, buyPrice: 0, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Elinor', brand: 'ELIYA', colour: ['Black'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3200, buyPrice: 0, rrp: 14000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Flavia', brand: 'LEXI', colour: ['Black'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1000, buyPrice: 0, rrp: 8000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Maya', brand: 'LEXI', colour: ['Black'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 2500, buyPrice: 0, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Violette', brand: 'AJE', colour: ['Blue'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3000, buyPrice: 0, rrp: 19000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party','date night'], style: 'classic', name: 'Delfina', brand: 'ALC', colour: ['Blue','Black'], size: ['6','8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 2300, buyPrice: 0, rrp: 25300, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Georgette', brand: 'HOUSE OF CB', colour: ['Blue'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1500, buyPrice: 0, rrp: 9000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Imogen', brand: 'HOUSE OF CB', colour: ['Blue'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1000, buyPrice: 0, rrp: 8300, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'jacket', bookingType: 'both', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Salome', brand: 'HOUSE OF CB', colour: ['Blue'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1200, buyPrice: 0, rrp: 8300, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Isadora', brand: 'LEXI', colour: ['Blue'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 800, buyPrice: 0, rrp: 6500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Polkadot', brand: 'ZIMMERMANN', colour: ['Blue'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 2900, buyPrice: 0, rrp: 62000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '1_lylEDzFxAE2CkwXx3tIv21xgu6qlmmT', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Paradiso', brand: 'AJE', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3500, buyPrice: 0, rrp: 29000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Olea', brand: 'BARDOT', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 700, buyPrice: 0, rrp: 6000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Francesca', brand: 'ELIYA', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3000, buyPrice: 0, rrp: 13000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Carmen', brand: 'HOUSE OF CB', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 900, buyPrice: 0, rrp: 7000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Sheena', brand: 'LEXI', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1200, buyPrice: 0, rrp: 9000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Lola', brand: 'NADINE MERABI', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 2100, buyPrice: 0, rrp: 23000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '1ul4o53wH6VGV5I7nqLS-TvC38dn3qDRz', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Aribella', brand: 'REFORMATION', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1200, buyPrice: 0, rrp: 11000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Anais', brand: 'ROCOCO SAND', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 2200, buyPrice: 0, rrp: 20000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: 'Lamour', brand: 'SELKIE', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1800, buyPrice: 0, rrp: 9500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: "Kiss On The Lips", brand: 'SELKIE', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1800, buyPrice: 0, rrp: 9500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: "Cosmic", brand: 'ZIMMERMANN', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3500, buyPrice: 0, rrp: 45000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: "Applique", brand: 'ZIMMERMANN', colour: ['Floral Print'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3000, buyPrice: 0, rrp: 35000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: "Carla", brand: 'ELIYA', colour: ['Gold'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3000, buyPrice: 0, rrp: 13500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: "Faye", brand: 'HOUSE OF CB', colour: ['Green'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1300, buyPrice: 0, rrp: 9000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: "Mathilde", brand: 'AJE', colour: ['Pink'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3000, buyPrice: 0, rrp: 16000, description: 'Aje The Mathilde Bubble Hem Midi ItemS', bust: '', waist: '', hips: '', longDescription: 'The Mathilde Bubble Hem Midi Item features pleating through to the drop waist and a voluminous bubble neckline and skirt. A statement style for any occasion, wear with your favourite Aje heel.', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: "Tidal", brand: 'AJE', colour: ['Pink'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3000, buyPrice: 0, rrp: 13500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2023', occasion: ['party'], style: 'classic', name: "Ribera", brand: 'BAOBAB', colour: ['Pink'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1600, buyPrice: 0, rrp: 12000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'buy', dateAdded: '01-01-2024', occasion: ['party'], style: 'classic', name: "Farah", brand: 'BRONX AND BANCO', colour: ['Pink'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3700, buyPrice: 9000, rrp: 32000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2024', occasion: ['party'], style: 'classic', name: "Genevieve", brand: 'HOUSE OF CB', colour: ['Pink'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 2000, buyPrice: 0, rrp: 10000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2024', occasion: ['party'], style: 'classic', name: "Tuxedo", brand: 'ZIMMERMANN', colour: ['Pink'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3000, buyPrice: 0, rrp: 35000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2024', occasion: ['party'], style: 'classic', name: "Esme", brand: 'ELIYA', colour: ['Red'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 3000, buyPrice: 0, rrp: 14000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2024', occasion: ['party'], style: 'classic', name: "Candice", brand: 'NADINE MERABI', colour: ['Red'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1900, buyPrice: 0, rrp: 13000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2024', occasion: ['party'], style: 'classic', name: "Flor", brand: 'REFORMATION', colour: ['Red'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1200, buyPrice: 0, rrp: 12900, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2024', occasion: ['party'], style: 'classic', name: "Socorro", brand: 'HOUSE OF CB', colour: ['Silver'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1000, buyPrice: 0, rrp: 8200, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2024', occasion: ['party'], style: 'classic', name: "Elia", brand: 'HOUSE OF CB', colour: ['White'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1000, buyPrice: 0, rrp: 7000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-01-2024', occasion: ['party'], style: 'classic', name: "Belinda", brand: 'LEXI', colour: ['White'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 1500, buyPrice: 0, rrp: 10000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
  Item(id: '-', type: 'dress', bookingType: 'rental', dateAdded: '01-06-2024', occasion: ['party'], style: 'classic', name: "Odessey", brand: 'ZIMMERMANN', colour: ['White'], size: ['8'], length: 'midi', print: 'none', sleeve: 'short sleeve', rentPrice: 5000, buyPrice: 0, rrp: 53000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', imageId: '', ),
];

class Item {
  
  Item({required this.id, 
          required this.type, 
          required this.bookingType, 
          required this.occasion,
          required this.dateAdded,
          required this.style, 
          required this.name, 
          required this.brand, 
          required this.colour, 
          required this.size, 
          required this.length,
          required this.print,
          required this.sleeve,
          required this.rentPrice, 
          required this.buyPrice, 
          required this.rrp,
          required this.description,
          required this.bust,
          required this.waist,
          required this.hips,
          required this.longDescription,
          required this.imageId,
        });

    String id;
    String type;
    String bookingType;
    List occasion;
    String dateAdded;
    String style;
    String name;
    String brand;
    List colour;
    List size;
    String length;
    String print;
    String sleeve;
    int rentPrice;
    int buyPrice;
    int rrp;
    String description;
    String bust;
    String waist;
    String hips;
    String longDescription;
    String imageId;
    


  // item to firestore (map, bust: '', waist: '', hips: '', imageId: '', )
  Map<String, dynamic> toFirestore() {
    return {
      'type': type,
      'bookingType': bookingType,
      'occasion': occasion,
      'dateAdded': dateAdded,
      'style': style,
      'name': name,
      'brand': brand,
      'colour': colour,
      'size': size,
      'length': length,
      'print': print,
      'sleeve': sleeve,
      'rentPrice': rentPrice,
      'buyPrice': buyPrice,
      'rrp': rrp,
      'description': description,
      'bust': bust,
      'waist': waist,
      'hips': hips,
      'longDescription': longDescription,
      'imageId': imageId,
    };
  }

  // character from firestore
  factory Item.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {

    // get data from snapshot
    final data = snapshot.data()!;

    // make character instance
    Item item = Item(
      id: snapshot.id,
      type: data['type'],
      bookingType: data['bookingType'],
      dateAdded: data['dateAdded'],
      occasion: data['occasion'],
      style: data['style'],
      name: data['name'],
      brand: data['brand'],
      colour: data['colour'],
      size: data['size'],
      length: data['length'],
      print: data['print'],
      sleeve: data['sleeve'],
      rentPrice: data['rentPrice'],
      buyPrice: data['buyPrice'],
      rrp: data['rrp'],
      description: data['description'],
      bust: data['bust'],
      waist: data['waist'],
      hips: data['hips'],
      longDescription: data['longDescription'],
      imageId: data['imageId'],
    );

    return item;
  } 
  
  
}
