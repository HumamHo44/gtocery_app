import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/slide_model.dart';

class SlideService {
  static Future<List<SlideModel>> getAllSlides() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('slides')
        .get();

    return snapshot.docs.map((doc) => SlideModel.fromMap(doc)).toList();
  }
}
