import 'package:flutter/material.dart';
import 'package:shoe_app/app/data/data.dart';

class ProductModel {
  String id;
  String name;
  List<String> image;
  Color? bgCol;
  double price;
  double? discountPrice;
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    this.bgCol,
    required this.price,
    this.discountPrice,
  });
}

List<ProductModel> discountedProducts = [
  ProductModel(
    id: '1',
    name: 'AIR MAX 90-EZ BLACK',
    image: [AppAssets.kNike1],
    price: 150,
    discountPrice: 200,
    bgCol: const Color(0xFFEEF9EE),
  ),
  ProductModel(
    id: '2',
    name: 'AIR MAX 90-EZ WHITE',
    image: [AppAssets.kNike2],
    price: 160,
    discountPrice: 210,
    bgCol: const Color(0xFFE8E8E8),
  ),
  ProductModel(
    id: '3',
    name: 'AIR MAX 95 RED',
    image: [AppAssets.kNike3],
    price: 170,
    discountPrice: 220,
    bgCol: const Color(0xFFFFE6E6),
  ),
  ProductModel(
    id: '4',
    name: 'AIR MAX 90-EZ BLUE',
    image: [AppAssets.kNike4],
    price: 180,
    discountPrice: 230,
    bgCol: const Color(0xFFE6EEFF),
  ),
  ProductModel(
    id: '5',
    name: 'AIR MAX 95 GREEN',
    image: [AppAssets.kNike5],
    price: 190,
    discountPrice: 240,
    bgCol: const Color(0xFFE6FFED),
  ),
  ProductModel(
    id: '6',
    name: 'AIR MAX 90-EZ YELLOW',
    image: [AppAssets.kNike6],
    price: 200,
    discountPrice: 250,
    bgCol: const Color(0xFFFFF6E6),
  ),
  ProductModel(
    id: '7',
    name: 'AIR MAX 95 PURPLE',
    image: [AppAssets.kNike7],
    price: 210,
    discountPrice: 260,
    bgCol: const Color(0xFFF2E6FF),
  ),
  ProductModel(
    id: '8',
    name: 'AIR MAX 90-EZ PINK',
    image: [AppAssets.kNike8],
    price: 220,
    discountPrice: 270,
    bgCol: const Color(0xFFFFE6F2),
  ),
];

