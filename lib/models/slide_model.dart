import 'package:cloud_firestore/cloud_firestore.dart';

class SlideModel {
  final String imageUrl;

  SlideModel({required this.imageUrl});

  factory SlideModel.fromMap(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return SlideModel(imageUrl: data['image'] ?? '');
  }
}
