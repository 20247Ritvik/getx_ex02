import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cartcontroller.dart';
import '../controllers/shop_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.productList[index].name}',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                      Text(
                                          '${controller.productList[index].productDesc}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  Text(
                                      '\$${controller.productList[index].price}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                ],
                              ),
                              Column(
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      cartController.addToCart(
                                          controller.productList[index]);
                                    },
                                    child: Text('Add to Cart',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      cartController.removeFromCart(
                                          controller.productList[index]);
                                    },
                                    child: Text('Remove Item',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  ),
                                ],
                              ),
                              Obx(() => IconButton(
                                    icon: controller
                                            .productList[index].isFavorite.value
                                        ? Icon(Icons.check_box_rounded)
                                        : Icon(Icons
                                            .check_box_outline_blank_outlined),
                                    onPressed: () {
                                      controller.productList[index].isFavorite
                                          .toggle();
                                    },
                                  ))
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text(
                  'Total amount: \$ ${controller.totalPrice}',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
    );
  }
}
