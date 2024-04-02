import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zinc_product_demo/models/product.dart';
import 'package:zinc_product_demo/repository/product_repository.dart';

final getIt = GetIt.instance;

class ProductViewModel with ChangeNotifier {
 
  final ProductRepository _productRepository = getIt<ProductRepository>();
 
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    _products = await _productRepository.fetchProducts();
    notifyListeners();
  }
}
