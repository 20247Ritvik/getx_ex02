import 'package:get/get.dart';

class Product {
  final int id;
  final String name;
  final String productDesc;
  final double price;

  Product({required this.id,
      required this.name,
      required this.productDesc,
      required this.price});

  final isFavorite = false.obs;
}


