import 'package:flutter/material.dart';
import 'package:geekgarden_test/data/store_controller.dart';
import 'package:geekgarden_test/models/local_product.dart';
import 'package:geekgarden_test/widget/dialog_edit_item.dart';
import 'package:geekgarden_test/widget/dialog_item_tap.dart';
import 'package:get/get.dart';

class ItemListLocalProduct extends StatelessWidget {
  final LocalProduct product;
  ItemListLocalProduct({super.key, required this.product});
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(
          DialogItemTap(
            onDelete: () {
              storeController.localProductList.remove(product);
              Get.back();
            },
            onEdit: () {
              Get.back();
              Get.dialog(DialogEditItem(product: product));
            },
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(
                product.image!,
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
                fit: BoxFit.fill,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text(
                      'Price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Rp ${product.price!.toString()},-',
                      style: const TextStyle(),
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      product.description!,
                      style: const TextStyle(),
                    ),
                    const Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            product.category!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
