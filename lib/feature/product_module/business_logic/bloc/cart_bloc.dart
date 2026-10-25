import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/product_model.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddProduct extends CartEvent {
  final ProductModel product;
  const AddProduct(this.product);
}

class RemoveProduct extends CartEvent {
  final String id;
  const RemoveProduct(this.id);
}

class ClearCart extends CartEvent {
  const ClearCart();
}

class CartState {
  final Map<String, int> quantities;
  final Map<String, ProductModel> products;
  const CartState(this.quantities, this.products);
  int get count => quantities.values.fold(0, (a, b) => a + b);
  double get total => quantities.entries.fold(
    0,
    (sum, item) => sum + products[item.key]!.price * item.value,
  );
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState({}, {})) {
    on<AddProduct>((event, emit) {
      final quantities = {
        ...state.quantities,
        event.product.id: (state.quantities[event.product.id] ?? 0) + 1,
      };
      emit(
        CartState(quantities, {
          ...state.products,
          event.product.id: event.product,
        }),
      );
    });
    on<RemoveProduct>((event, emit) {
      final quantities = {...state.quantities};
      final next = (quantities[event.id] ?? 1) - 1;
      next <= 0 ? quantities.remove(event.id) : quantities[event.id] = next;
      emit(CartState(quantities, state.products));
    });
    on<ClearCart>((event, emit) => emit(const CartState({}, {})));
  }
}
