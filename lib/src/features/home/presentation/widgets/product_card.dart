import 'package:batter_high/src/features/home/domain/model/product_list_response/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../cart/domain/model/cart.dart';
import '../../../cart/presentation/provider/cart_notifier.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              if (product.image?.isNotEmpty == true)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image(
                    image: NetworkImage(product.image ?? ""),
                    errorBuilder: (context, error, stackTrace) {
                      return Text(
                        "No Image",
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: Colors.red.shade200,
                                ),
                        textAlign: TextAlign.center,
                      );
                    },
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
                          (product.categories?.firstOrNull ?? "").toUpperCase(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
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
                  product.name ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                // horizontalTitleGap: 8,

                subtitle: Text(
                  product.description ?? "",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black54, fontWeight: FontWeight.w600),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Add to cart button
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                final cartState = ref.watch(cartNotifierProvider);
                final cart = cartState.asData?.value;
                if (cart != null) {
                  ref.read(cartNotifierProvider.notifier).addItem(CartItem(
                      name: product.name ?? "",
                      price: product.price ?? 0,
                      quantity: 1));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
