import 'dart:async';
import 'package:batter_high/src/features/home/domain/model/product_list_response/product.dart';
import 'package:batter_high/src/features/home/presentation/providers/product/product_state_provider.dart';
import 'package:batter_high/src/features/home/presentation/providers/product/state/product_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../cart/presentation/provider/cart_notifier.dart';
import '../../../cart/domain/model/cart.dart';

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
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.productResp.data?.products?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.65,
                  ),
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int i) {
                    print(i);
                    return GestureDetector(
                      onDoubleTap: () {
                        final cartState = ref.watch(cartNotifierProvider);
                        final cart = cartState.asData?.value;
                        if (cart != null) {
                          ref.read(cartNotifierProvider.notifier).addItem(
                              CartItem(
                                  name: state.productResp.data?.products?[i]
                                          .name ??
                                      "",
                                  price: state.productResp.data?.products?[i]
                                          .price ??
                                      0,
                                  quantity: 1));
                        }
                      },
                      child: ProductCard(
                          news: state.productResp.data!.products![i]),
                    );
                    // return ListTile(
                    //   dense: false,
                    //   visualDensity: VisualDensity.compact,
                    //   contentPadding: const EdgeInsets.symmetric(
                    //       vertical: 0, horizontal: 8),
                    //   onTap: () async {
                    //     print(state.productResp.data?.products?[i].name);

                    //     // print(GoRouterState.of(context).matchedLocation);
                    //     // Navigator.of(ctx).pop();
                    //   },
                    //   trailing: const Icon(Icons.chevron_right_outlined),
                    //   title: Text(
                    //       state.productResp.data?.products?[i].name ?? ""),
                    // );
                  },

                  // separatorBuilder: (context, index) => const Divider(
                  //   thickness: .05,
                  // ),
                  // itemCount: state.productResp.data?.products?.length ?? 0,
                )
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

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.news,
  });

  final Product news;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          if (news.image?.isNotEmpty == true)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image(
                  image: NetworkImage(news.image ?? ""),
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "No\nImage",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: Colors.black12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.red),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      (news.categories?.firstOrNull ?? "").toUpperCase(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            isThreeLine: true,
            dense: false,
            visualDensity: VisualDensity.standard,
            title: Text(
              news.name ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            // horizontalTitleGap: 8,

            subtitle: Text(
              news.description ?? "",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black38, fontWeight: FontWeight.w600),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
