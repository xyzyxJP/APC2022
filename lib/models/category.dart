import 'package:flutter/material.dart';

class Category {
  String id;
  String name;
  IconData icon;

  Category({required this.id, required this.name, required this.icon});
}

class CategoryMap {
  String name;
  Color color;
  List<Category> list;

  CategoryMap({required this.name, required this.color, required this.list});
}
