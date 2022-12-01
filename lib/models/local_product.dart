import 'dart:io' as io;

class LocalProduct {
  String? id;
  String? title;
  double? price;
  String? description;
  String? category;
  io.File? image;

  LocalProduct(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image});
}
