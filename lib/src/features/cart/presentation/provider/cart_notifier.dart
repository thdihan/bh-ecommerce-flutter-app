import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../domain/model/cart.dart';
import '../../data/repository/cart_repository.dart';

final cartNotifierProvider = StateNotifierProvider<CartNotifier, AsyncValue<Cart>>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return CartNotifier(repository);
});

class CartNotifier extends StateNotifier<AsyncValue<Cart>> {
  final CartRepository _repository;

  CartNotifier(this._repository) : super(const AsyncLoading()) {
    _loadCart();
  }

  Future<void> _loadCart() async {
    try {
      final cart = await _repository.getCart();
      state = AsyncData(cart);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> addItem(CartItem item) async {
    if (state is AsyncData<Cart>) {
      final cart = state.asData!.value;
      final updatedCart = cart.copyWith(items: [...cart.items, item]);
      state = AsyncData(updatedCart);
      await _repository.saveCart(updatedCart);
    }
  }
}
