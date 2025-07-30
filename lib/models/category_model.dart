import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../home/vegetables_page.dart';

class CategoryModel {
  final String id;
  final String iconPath;
  final String title;

  CategoryModel({
    required this.id,
    required this.iconPath,
    required this.title,
  });

  factory CategoryModel.fromMap(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryModel(
      id: doc.id,
      iconPath: data['image'] ?? '',
      title: data['name'] ?? '',
    );
  }

  VoidCallback get onTap {
    return () => VegetablesPage();
  }
}
