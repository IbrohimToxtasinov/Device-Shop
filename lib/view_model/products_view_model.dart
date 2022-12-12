import 'dart:async';
import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository productRepository;

  ProductViewModel({required this.productRepository}) {
    listenProducts("");
  }

  late StreamSubscription subscription;

  List<ProductModel> products = [];

    listenProducts(String categoryId) async {
    subscription = productRepository
        .getProducts(categoryId: categoryId)
        .listen((allProducts) {
      print("ALL PRODUCTS LENGTH:${allProducts.length}");
      products = allProducts;
      notifyListeners();
    });
  }

  addProduct(ProductModel productModel) =>
      productRepository.addProducts(productModel: productModel);
  updateProduct(ProductModel productModel) =>
      productRepository.updateProducts(productModel: productModel);
  deleteProduct(String docId) => productRepository.deleteProducts(doId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
