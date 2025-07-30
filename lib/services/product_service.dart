import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  static Future<List<ProductModels>> getAllProducts() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("products")
        .get();

    return snapshot.docs.map((doc) => ProductModels.fromMap(doc)).toList();
  }
}
