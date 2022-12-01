import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/store_controller.dart';
import '../widget/custom_rounded_button.dart';
import '../widget/dialog_add_item.dart';
import '../widget/item_list_local_product.dart';

class LocalStorePage extends StatefulWidget {
  const LocalStorePage({super.key});

  @override
  State<LocalStorePage> createState() => _LocalStorePageState();
}

class _LocalStorePageState extends State<LocalStorePage> {
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    return SizedBox(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemBuilder: (context, index) {
                          if (storeController.localProductList.isNotEmpty) {
                            return ItemListLocalProduct(
                                product:
                                    storeController.localProductList[index]);
                          } else {
                            return const Text(
                              'Please tap the button below to add items.',
                              style: TextStyle(color: Colors.grey),
                            );
                          }
                        },
                        itemCount: storeController.localProductList.length,
                      ),
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
