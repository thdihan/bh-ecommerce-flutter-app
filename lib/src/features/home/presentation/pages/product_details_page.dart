import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/product/product_details_state_provider.dart';
import '../providers/product/state/product_details_state.dart';

class ProductDetailsPage extends ConsumerStatefulWidget {
  const ProductDetailsPage({
    super.key,
    required this.id,
  });
  final String id;

  @override
  ConsumerState<ProductDetailsPage> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<ProductDetailsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final notifier = ref.read(productDetailsNotifierProvider.notifier);

      await notifier.fetchProductById(id: widget.id);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productDetailsNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: state.status == ProductDetailsStatus.loading
            ? const Center(
                child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ))
            : state.hasData
                ? SizedBox(
                    // height: 600,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Image(
                          image:
                              NetworkImage(state.productResp.data?.image ?? ""),
                        ),
                        Text(state.productResp.data?.name ?? ""),
                      ],
                    ),
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
