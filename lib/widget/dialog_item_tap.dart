import 'package:flutter/material.dart';
import 'package:geekgarden_test/widget/custom_rounded_button.dart';
import 'package:get/get.dart';

class DialogItemTap extends StatelessWidget {
  final Function() onDelete;
  final Function() onEdit;
  const DialogItemTap(
      {super.key, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Item Action',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomRoundedButton(
                    onBtTap: () {
                      onDelete();
                    },
                    btText: 'Delete Product',
                    btColor: Colors.red,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomRoundedButton(
                    onBtTap: () {
                      onEdit();
                    },
                    btText: 'Edit Product',
                    btColor: Colors.green,
                  ),
                ),
              ],
            ),
            CustomRoundedButton(
              onBtTap: () {
                Get.back();
              },
              btText: 'Cancel',
            ),
          ],
        ),
      ),
    );
  }
}
