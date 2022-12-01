import 'package:flutter/material.dart';
import 'package:geekgarden_test/data/store_controller.dart';
import 'package:geekgarden_test/widget/custom_rounded_button.dart';
import 'package:geekgarden_test/widget/dialog_add_item.dart';
import 'package:geekgarden_test/widget/item_list_local_product.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geekgarden Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Local Store',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Obx(() {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemBuilder: (context, index) {
                        return ItemListLocalProduct(
                            product: storeController.localProductList[index]);
                      },
                      itemCount: storeController.localProductList.length,
                    );
                  })),
            ),
            CustomRoundedButton(
              onBtTap: () {
                Get.dialog(const DialogAddItem());
              },
              btText: 'Add an Item',
            )
          ],
        ),
      ),
    );
  }
}
