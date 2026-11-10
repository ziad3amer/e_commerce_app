

import '../model/product_model.dart';
import '../wep_service/product_dio.dart';

class ProductRepository {
  final ProductDio productDio;
  ProductRepository(this.productDio);

  Future<List<ProductModel>> getProducts() async {
    final response = await productDio.getProducts();
    final List<dynamic> productsJson = response.data['products'];
    return productsJson
        .map((item) => ProductModel.fromJson(item))
        .toList();
  }
}