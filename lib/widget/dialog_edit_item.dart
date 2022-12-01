import 'package:flutter/material.dart';
import 'package:geekgarden_test/models/local_product.dart';
import 'package:geekgarden_test/widget/custom_rounded_button.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/store_controller.dart';
import 'dart:io' as Io;

import '../data/utils.dart';

class DialogEditItem extends StatefulWidget {
  final LocalProduct product;
  const DialogEditItem({super.key, required this.product});

  @override
  State<DialogEditItem> createState() => _DialogEditItemState();
}

class _DialogEditItemState extends State<DialogEditItem> {
  final _storeController = Get.find<StoreController>();
  bool isImageChanged = false;
  Io.File? _image;
  final _picker = ImagePicker();
  final _controllerTitle = TextEditingController();
  final _controllerPrice = TextEditingController();
  final _controllerDesc = TextEditingController();
  final _controllerCategory = TextEditingController();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Text(
              'New product details',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              'Product title',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _controllerTitle,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                hintStyle: const TextStyle(
                    color: Colors.grey, fontStyle: FontStyle.italic),
                hintText: "Type product title",
                fillColor: Colors.white70,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Price',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _controllerPrice,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintStyle: const TextStyle(
                    color: Colors.grey, fontStyle: FontStyle.italic),
                hintText: "Type product price",
                fillColor: Colors.white70,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _controllerDesc,
              minLines: 3,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                hintStyle: const TextStyle(
                    color: Colors.grey, fontStyle: FontStyle.italic),
                hintText: "Type product description",
                fillColor: Colors.white70,
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Category',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _controllerCategory,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
                hintText: "Type product category",
                fillColor: Colors.white70,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Product image',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              child: isImageChanged ? Image.file(_image!) : const SizedBox(),
            ),
            const SizedBox(height: 5),
            CustomRoundedButton(
              onBtTap: () {
                _onImagePickTapped();
              },
              btText: isImageChanged
                  ? 'Change image product'
                  : 'Select image product',
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomRoundedButton(
                        onBtTap: () {
                          // _onProductAdded();
                          _onProductEdit();
                        },
                        btText: 'Edit Product',
                        btColor: Colors.green),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomRoundedButton(
                      onBtTap: () {
                        Get.back();
                      },
                      btText: 'Cancel',
                      btColor: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onImagePickTapped() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Get.back();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _imgFromCamera();
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _imgFromGallery() async {
    XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 20);
    if (imagePicked != null) {
      setState(() {
        _image = Io.File(imagePicked.path);
        isImageChanged = true;
      });
    }
  }

  _imgFromCamera() async {
    XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 20);
    if (imagePicked != null) {
      setState(() {
        _image = Io.File(imagePicked.path);
        isImageChanged = true;
      });
    }
  }

  void _loadData() {
    _controllerTitle.text = widget.product.title!;
    int priceInt = widget.product.price!.toInt();
    _controllerPrice.text = priceInt.toString();
    _controllerDesc.text = widget.product.description!;
    _controllerCategory.text = widget.product.category!;
    _image = widget.product.image;
    isImageChanged = true;
    setState(() {});
  }

  void _onProductEdit() {
    LocalProduct editedProduct = LocalProduct(
      id: widget.product.id,
      title: _controllerTitle.text,
      price: double.parse(_controllerPrice.text),
      description: _controllerDesc.text,
      image: _image,
      category: _controllerCategory.text,
    );
    _storeController.editLocalProduct(editedProduct);
    Get.back();
  }
}
