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
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        child: Image.file(
                          product.image!,
                          // height: MediaQuery.of(context).size.height * 0.15,
                          // width: MediaQuery.of(context).size.height * 0.30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Text(
                          '\$ ${product.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.description!,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.black,
                          ),
                          Text(
                            '0.0',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
