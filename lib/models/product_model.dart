import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModels {
  final String id;
  final String name;
  final String image;
  final String weight;
  final String price;

  ProductModels({
    required this.id,
    required this.name,
    required this.image,
    required this.weight,
    required this.price,
  });

  factory ProductModels.fromMap(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProductModels(
      id: doc.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      weight: data['weight'].toString(),
      price: data['price'].toString(),
    );
  }
}
