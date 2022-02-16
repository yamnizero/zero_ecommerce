import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });


  @override
  List<Object?> get props => [name, imageUrl];


  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'], imageUrl: snap['imageUrl'],);
    return category;

  }

  static List<Category> categories = [
    const Category(
      name: 'Soft Drink',
      imageUrl: 'https://images.unsplash.com/photo-1603394630850-69b3ca8121ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHNvZnQlMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    const Category(
      name: 'Smoothies',
      imageUrl: 'https://images.unsplash.com/photo-1502741224143-90386d7f8c82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80',

    ),
    const Category(
      name: 'Water',
      imageUrl: 'https://images.unsplash.com/photo-1559839914-17aae19cec71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
    ),
  ];
}