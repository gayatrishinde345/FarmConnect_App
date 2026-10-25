import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/product_model.dart';
import '../../data/repository/product_repository.dart';

abstract class ProductListEvent {
  const ProductListEvent();
}

class LoadProducts extends ProductListEvent {
  const LoadProducts();
}

class SearchProducts extends ProductListEvent {
  final String query;
  const SearchProducts(this.query);
}

sealed class ProductListState {
  const ProductListState();
}

class ProductListInitial extends ProductListState {
  const ProductListInitial();
}

class ProductListLoading extends ProductListState {
  const ProductListLoading();
}

class ProductListSuccess extends ProductListState {
  final List<ProductModel> products;
  const ProductListSuccess(this.products);
}

class ProductListFailure extends ProductListState {
  final String message;
  const ProductListFailure(this.message);
}

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository repository;
  List<ProductModel> _all = const [];
  ProductListBloc({ProductRepository? productRepository})
    : repository = productRepository ?? ProductRepository(),
      super(const ProductListInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(const ProductListLoading());
      try {
        _all = await repository.fetchProducts();
        emit(ProductListSuccess(_all));
      } catch (_) {
        emit(const ProductListFailure('network'));
      }
    });
    on<SearchProducts>((event, emit) {
      final query = event.query.toLowerCase();
      emit(
        ProductListSuccess(
          _all
              .where(
                (p) =>
                    p.name.toLowerCase().contains(query) ||
                    p.category.toLowerCase().contains(query),
              )
              .toList(),
        ),
      );
    });
  }
}
