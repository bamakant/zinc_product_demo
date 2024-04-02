import 'package:get_it/get_it.dart';
import 'package:zinc_product_demo/models/product.dart';
import 'package:zinc_product_demo/service/product_service.dart';

final getIt = GetIt.instance;

class ProductRepository {
  final ProductService _productService = getIt<ProductService>();

  Future<List<Product>> fetchProducts() => _productService.fetchProducts();
}
