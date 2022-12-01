import 'dart:convert';

import 'package:geekgarden_test/models/local_product.dart';
import 'package:geekgarden_test/models/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StoreController extends GetxController {
  final localProductList = <LocalProduct>[].obs;
  final onlineProductList = <Product>[].obs;

  void addLocalProduct(LocalProduct product) {
    localProductList.add(product);
  }

  void editLocalProduct(LocalProduct product) {
    int index =
        localProductList.indexWhere((element) => element.id == product.id);
    localProductList.removeAt(index);
    localProductList.insert(index, product);
  }

  void loadOnlineProduct() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final jsonItems = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Product> resProductList = jsonItems.map<Product>((json) {
        return Product.fromJson(json);
      }).toList();
      onlineProductList.value = resProductList;
    }
  }
}
