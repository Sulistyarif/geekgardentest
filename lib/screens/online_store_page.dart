import 'package:flutter/material.dart';
import 'package:geekgarden_test/data/store_controller.dart';
import 'package:geekgarden_test/widget/item_list_online_product.dart';
import 'package:get/get.dart';

class OnlineStorePage extends StatefulWidget {
  const OnlineStorePage({super.key});

  @override
  State<OnlineStorePage> createState() => _OnlineStorePageState();
}

class _OnlineStorePageState extends State<OnlineStorePage> {
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geekgarden Store'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          /* return Text(
              storeController.onlineProductList[index].obs.value.title!); */
          return ItemListOnlineProduct(
              product: storeController.onlineProductList[index]);
        },
        itemCount: storeController.onlineProductList.length,
      ),
    );
  }
}
