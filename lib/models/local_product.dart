import 'dart:io' as Io;

class LocalProduct {
  String? id;
  String? title;
  double? price;
  String? description;
  String? category;
  Io.File? image;

  LocalProduct(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image});
}
