
import 'dart:math' as math;

import 'package:flutter/material.dart';

class Category {
  const Category({ this.title, this.assets });
  final String title;
  final List<String> assets;
  @override
  String toString() => '$runtimeType("$title")';
}



const List<Category> allCategories = <Category>[
  Category(
    title: 'A',
    assets: [
      'images/products/0-0.jpg',
      'images/products/1-0.jpg',
      'images/products/2-0.jpg',
      'images/products/3-0.jpg'
    ],
  ),
  Category(
    title: 'B',
    assets: [
      'images/products/4-0.jpg',
      'images/products/5-0.jpg',
      'images/products/6-0.jpg',
      'images/products/7-0.jpg'
    ],
  ),
  Category(
    title: 'C',
    assets: [
      'images/products/8-0.jpg',
      'images/products/9-0.jpg',
      'images/products/10-0.jpg',
      'images/products/11-0.jpg',
      'images/products/12-0.jpg'
    ],
  ),
   Category(
    title: 'All',
    assets: [
       'images/products/0-0.jpg',
      'images/products/1-0.jpg',
      'images/products/2-0.jpg',
      'images/products/3-0.jpg',
      'images/products/4-0.jpg',
      'images/products/5-0.jpg',
      'images/products/6-0.jpg',
      'images/products/7-0.jpg',
      'images/products/8-0.jpg',
      'images/products/9-0.jpg',
      'images/products/10-0.jpg',
      'images/products/11-0.jpg',
      'images/products/12-0.jpg'
    ],
  ),
  
];