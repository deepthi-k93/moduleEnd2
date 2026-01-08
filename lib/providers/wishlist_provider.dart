import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:module2_end_assignment/models/product_model.dart';

class WishlistProvider extends ChangeNotifier {
  var logger = Logger();

  final List<ProductModel> _wishlistItems = [];
  List<ProductModel> get wishlistItems => [..._wishlistItems];
  int get wishlistCount => _wishlistItems.length;
  bool isInWishlist(String productId) {
    return _wishlistItems.any((item) => item.id.toString() == productId);
  }

  void toggleWishListItems(ProductModel product) {
    logger.i("hi");
    if (isInWishlist(product.id.toString())) {
      logger.i("removed");
      _wishlistItems.removeWhere((item) => item.id == product.id);
    } else {
      logger.i("added");
      _wishlistItems.add(product);
    }
    notifyListeners();
  }

  void removeWIshListItems(String productId) {
    _wishlistItems.removeWhere((item) => item.id.toString() == productId);
    notifyListeners();
  }

  ProductModel? productDetails;
  void setProductDetails(ProductModel product) {
    productDetails = product;
    notifyListeners();
  }
}
