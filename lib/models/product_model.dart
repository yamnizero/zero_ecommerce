import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });


  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular'],
    );
    return product;
  }

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static List<Product> products = [
    const Product(
        name: 'Soft Drink #1',
        category: 'Soft Drink',
        imageUrl: 'https://images.unsplash.com/photo-1603394630850-69b3ca8121ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHNvZnQlMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        price: 2.99,
        isRecommended: true,
        isPopular: false
    ),
    const Product(
        name: 'Soft Drink #2',
        category: 'Soft Drink',
        imageUrl: 'https://images.unsplash.com/photo-1625740822008-e45abf4e01d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c29mdCUyMGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        price: 2.99,
        isRecommended: false,
        isPopular: true
    ),
    const Product(
        name: 'Soft Drink #3',
        category: 'Soft Drink',
        imageUrl: 'https://images.unsplash.com/photo-1603833963276-76538890e68e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHNvZnQlMjBkcmlua3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        price: 2.99,
        isRecommended: true,
        isPopular: true
    ),
    const Product(
        name: 'Soft Drink #4',
        category: 'Soft Drink',
        imageUrl: 'https://images.unsplash.com/photo-1625740822008-e45abf4e01d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c29mdCUyMGRyaW5rc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        price: 2.99,
        isRecommended: false,
        isPopular: true
    ),
    const Product(
        name: 'Smoothies #1',
        category: 'Smoothies',
        imageUrl: 'https://media.istockphoto.com/photos/acai-smoothie-bowl-with-toppings-picture-id1298159858?b=1&k=20&m=1298159858&s=170667a&w=0&h=fQei4M7bo5YYKDBiuT_u6d-DoOBrjLYSQscmz6C3iTE=',
        price: 2.99,
        isRecommended: true,
        isPopular: false,
    ),
    const Product(
        name: 'Smoothies #2',
        category: 'Smoothies',
        imageUrl: 'https://images.unsplash.com/photo-1483918793747-5adbf82956c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHNtb290aGllc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        price: 2.99,
        isRecommended: false,
        isPopular: false,
    ),
  ];
}
