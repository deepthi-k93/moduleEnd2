class ProductModel {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;
ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
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
