part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductLoading extends ProductsState {}

final class ProductSuccess extends ProductsState{
  final List<ProductModel> products;
  ProductSuccess(this.products);
}
final class ProductError extends ProductsState{
  final String error;
  ProductError(this.error);

}
