import 'package:get/state_manager.dart';
import '../models/product_items.dart';

class ShoppingController extends GetxController {
  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var response = [
      Product(
          id: 1,
          name: "Product1",
          productDesc: "wdvdduekvd2liehi2d",
          price: 20),
      Product(
          id: 2,
          name: "Product1",
          productDesc: "wdvdduekvd2liehi2d",
          price: 60),
      Product(
          id: 3,
          name: "Product1",
          productDesc: "wdvdduekvd2liehi2d",
          price: 120),
    ];
    productList.assignAll(response);
  }
}
