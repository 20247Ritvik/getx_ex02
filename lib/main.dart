import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ex02/controllers/shop_controller.dart';
import 'package:getx_ex02/views/shopping_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingPage(),
    );
  }
}
