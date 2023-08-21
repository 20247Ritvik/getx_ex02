import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/product_items.dart';

class CartController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;

  int get count => cartItems.length;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItems.add(product);
  }

  removeFromCart(Product product) {
    cartItems.remove(product);
  }
}
