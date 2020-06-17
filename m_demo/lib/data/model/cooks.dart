import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Cooks {
  const Cooks({
    this.name,
    this.description,
    this.imagePath,
    this.imagePackage,
    this.typeImagePath,
    this.typeImagePackage,
    this.ingredients,
    this.steps,
  });

  final String name;
  final String description;
  final String imagePath;
  final String imagePackage;
  final String typeImagePath;
  final String typeImagePackage;
  final List<FoodIngredient> ingredients;
  final List<CookStep> steps;
}

class FoodIngredient {
  const FoodIngredient({this.amount, this.ingredientName});
  final String amount;
  final String ingredientName;
}

class CookStep {
  const CookStep({this.duration, this.description});
  final String duration;
  final String description;
}

const List<Cooks> kCooksTest = <Cooks>[
  Cooks(
    name: '名称',
    typeImagePath: 'images/icons/icon1.png',
    // ingredientsImagePackage:,
    description:
        '简介',
    imagePath: 'images/foods/food1.jpg',
    // imagePackage: _kGalleryAssetsPackage,
    ingredients: <FoodIngredient>[
      FoodIngredient(amount: '数量', ingredientName: '材料名'),
    ],
    steps: <CookStep>[
      CookStep(duration: '时间', description: '操作'),
    ],
  ),
  Cooks(
    name: '鲷鱼烧',
    typeImagePath: 'images/icons/icon3.png',
    // ingredientsImagePackage:,
    description:
        '简介',
    imagePath: 'images/foods/food3.jpg',
    // imagePackage: _kGalleryAssetsPackage,
    ingredients: <FoodIngredient>[
      FoodIngredient(amount: '母鸡', ingredientName: '母鸡'),
    ],
    steps: <CookStep>[
      CookStep(duration: '母鸡', description: '母鸡'),
    ],
  ),
];

class CookStyle extends TextStyle {
  const CookStyle({
    double fontSize = 12.0,
    FontWeight fontWeight,
    Color color = Colors.black87,
    double letterSpacing,
    double height,
  }) : super(
          inherit: false,
          color: color,
          fontFamily: 'DancingScript',
          fontSize: fontSize,
          fontWeight: fontWeight,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: letterSpacing,
          height: height,
        );
}