import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final String imageName;
  final Color color;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.imageName,
    required this.color,
  });
}
