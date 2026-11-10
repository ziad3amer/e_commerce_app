import 'package:dio/dio.dart';

import '../../constanse/strings.dart';

//da awl file hayst2bl el data mn el Api
class ProductDio {
  late Dio dio;

  ProductDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<Response> getProducts() async {
    final response = await dio.get('/products');
    return response.data;
  }
}