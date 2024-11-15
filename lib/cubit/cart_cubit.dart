import 'package:flutter_bloc/flutter_bloc.dart';

class CartState {
  final List<Map<String, dynamic>> items;

  CartState(this.items);
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void addToCart(String productId, String productName, double productPrice) {
    final newItem = {
      'id': productId,
      'name': productName,
      'price': productPrice,
    };
    final updatedItems = List<Map<String, dynamic>>.from(state.items)..add(newItem);
    emit(CartState(updatedItems));
  }
}