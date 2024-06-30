import 'dart:async';
import 'package:batter_high/src/features/home/domain/model/product_list_response/product.dart';
import 'package:batter_high/src/features/home/presentation/providers/product/product_state_provider.dart';
import 'package:batter_high/src/features/home/presentation/providers/product/state/product_state.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../cart/domain/model/cart.dart';
import '../../../cart/presentation/provider/cart_notifier.dart';
import 'product_card.dart';

class ProductListWidget extends ConsumerStatefulWidget {
  const ProductListWidget({super.key});

  @override
  ConsumerState<ProductListWidget> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<ProductListWidget> {
  // final scrollController = ScrollController();
  // final TextEditingController searchController = TextEditingController();
  // bool isSearchActive = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    // scrollController.addListener(scrollControllerListener);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  // void scrollControllerListener() {
  //   if (scrollController.position.maxScrollExtent == scrollController.offset) {
  //     final notifier = ref.read(dashboardNotifierProvider.notifier);

  //     notifier.fetchProducts();
  //   }
  // }

  void refreshScrollControllerListener() {
    // scrollController.removeListener(scrollControllerListener);
    // scrollController.addListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productNotifierProvider);

    // ref.listen(
    //   dashboardNotifierProvider.select((value) => value),
    //   ((DashboardState? previous, DashboardState next) {
    //     //show Snackbar on failure
    //     if (next.status == DashboardConcreteState.fetchedAllProducts) {
    //       if (next.message.isNotEmpty) {
    //         ScaffoldMessenger.of(context)
    //             .showSnackBar(SnackBar(content: Text(next.message.toString())));
    //       }
    //     }
    //   }),
    // );
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: state.status == ProductStatus.loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ))
          : state.hasData
              ? SizedBox(
                  // height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: state.productResp.data?.products?.length ?? 0,
                      itemBuilder: (ctx, i) {
                        print(i);
                        return GestureDetector(
                          // onDoubleTap: () {
                          //   final cartState = ref.watch(cartNotifierProvider);
                          //   final cart = cartState.asData?.value;
                          //   if (cart != null) {
                          //     ref.read(cartNotifierProvider.notifier).addItem(
                          //         CartItem(
                          //             name: state.productResp.data?.products?[i]
                          //                     .name ??
                          //                 "",
                          //             price: state.productResp.data
                          //                     ?.products?[i].price ??
                          //                 0,
                          //             quantity: 1));
                          //   }
                          // },
                          child: ProductCard(
                              product: state.productResp.data!.products![i]),
                        );
                      }))
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
    );
  }

  // _onSearchChanged(String query) {
  //   if (_debounce?.isActive ?? false) _debounce?.cancel();
  //   _debounce = Timer(const Duration(milliseconds: 500), () {
  //     ref.read(dashboardNotifierProvider.notifier).searchProducts(query);
  //   });
  // }
}
