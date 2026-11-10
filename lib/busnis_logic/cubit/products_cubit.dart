import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/product_model.dart';
import '../../data/reposatory/reposatory_product.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository productRepository;
  ProductsCubit(this.productRepository) : super(ProductLoading());
  List<ProductModel> products = [];

  Future<void> getProducts()async{
    emit(ProductLoading());
    try{
      final product = await productRepository.getProducts();
      emit(ProductSuccess(product));
    }
    catch(e){
      emit(ProductError(e.toString()));
    }

  }
}
