class CartProductModel {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final String? image;
  final double? count;
  CartProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price, 
    required this.count,
  });
  // ProductModel(this. id ,this.name, this.description, this.price, this.image);
  // factory ProductModel.fromMap(Map<String, dynamic> json) {
  //   return ProductModel(
  //     json['id'],
  //     json['name'],
  //     json['description'],
  //     json['price'],
  //     json['image'],
  //   );
  // }
}
