class Dress {
  
  Dress({required this.id, 
          required this.name, 
          required this.brand, 
          required this.size, 
          required this.rentPrice, 
          required this.rrp, 
          required this.image}); 

    int id;
    String name;
    String brand;
    int size;
    int rentPrice;
    int rrp;
    String image;
  
}

List<Dress> dresses = [
  Dress(id: 1, name: 'Mathilde Bubble', brand: 'AJE', size: 52, rentPrice: 1200, rrp: 12000, image: 'AJE_Mathilde_Bubble_Dress.webp'),
  Dress(id: 2, name: 'Carla', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
  Dress(id: 3, name: 'Elinor', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
  Dress(id: 4, name: 'Francesca Mini', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
  Dress(id: 5, name: 'Dione', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
  Dress(id: 6, name: 'Riley Chiffon', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
  Dress(id: 7, name: 'Sheena', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000, image: '3_dress.jpg'),
];