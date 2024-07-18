class Dress {
  
  Dress({required this.id, 
          required this.name, 
          required this.brand, 
          required this.size, 
          required this.price, 
          required this.image}); 

    int id;
    String name;
    String brand;
    int size;
    int price;
    String image;
  
}

List<Dress> dresses = [
  Dress(id: 1, name: 'Sheena Maxi Dress ', brand: 'Lexi', size: 52, price: 1200, image: 'example_dress.png'),
  Dress(id: 2, name: 'Sheena Maxi Dress ', brand: 'Lexi', size: 52, price: 1200, image: 'example_dress.png'),
  Dress(id: 3, name: 'Sheena Maxi Dress ', brand: 'Lexi', size: 52, price: 1200, image: 'example_dress.png'),
  Dress(id: 4, name: 'Sheena Maxi Dress ', brand: 'Lexi', size: 52, price: 1200, image: 'example_dress.png'),
];