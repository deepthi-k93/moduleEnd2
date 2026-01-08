import 'package:flutter/material.dart';
import 'package:module2_end_assignment/models/product_model.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> productsList = [
    ProductModel(
      id: 1,
      name: 'Frock_violet',
      image: 'images/product1.jpg',
      description: 'Violet frilled frock',
      price: 850,
    ),

    ProductModel(
      id: 2,
      name: 'Pink_frock',
      image: 'images/product2.jpg',
      description: 'Pink frock',
      price: 450,
    ),
    ProductModel(
      id: 3,
      name: 'pink_frock2',
      image: 'images/product3.jpg',
      description: 'Pink Frock',
      price: 650,
    ),
    ProductModel(
      id: 4,
      name: 'trouser_tshirt',
      image: 'images/product4.jpg',
      description: 'denim trousers with white t-shirt',
      price: 700,
    ),
    ProductModel(
      id: 5,
      name: 'pink_frock3',
      image: 'images/product5.jpg',
      description: 'baby pink frock with closed neck',
      price: 80,
    ),
    ProductModel(
      id: 6,
      name: '22FW',
      image: 'images/product1.jpg',
      description: 'Violet frilled frock',
      price: 850,
    ),
    ProductModel(
      id: 7,
      name: '23SP',
      image: 'images/product2.jpg',
      description: 'Pink frock',
      price: 450,
    ),
    ProductModel(
      id: 8,
      name: '23SS',
      image: 'images/product3.jpg',
      description: 'Pink Frock',
      price: 650,
    ),
    ProductModel(
      id: 9,
      name: '23FW',
      image: 'images/product4.jpg',
      description: 'denim trousers with white t-shirt',
      price: 700,
    ),
    ProductModel(
      id: 10,
      name: 'pink_frock4',
      image: 'images/product5.jpg',
      description: 'baby pink frock with closed neck',
      price: 500,
    ),
  ];
  ProductModel? productDetails;
  void setProductDetails(ProductModel product) {
    productDetails = product;
    notifyListeners();
  }
}
