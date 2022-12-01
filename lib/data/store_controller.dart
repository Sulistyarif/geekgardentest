import 'package:geekgarden_test/models/local_product.dart';
import 'package:geekgarden_test/models/product.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final localProductList = <LocalProduct>[].obs;
  final onlineProductList = <Product>[].obs;

  void addLocalProduct(LocalProduct product) {
    localProductList.add(product);
  }

  void setOnlineProduct(List<Product> productList) {
    onlineProductList.value = productList;
  }

  void editLocalProduct(LocalProduct product) {
    // int index = localProductList.indexOf(product);
    int index =
        localProductList.indexWhere((element) => element.id == product.id);
    localProductList.removeAt(index);
    localProductList.insert(index, product);
    // print('index barang: $index');
  }
}
