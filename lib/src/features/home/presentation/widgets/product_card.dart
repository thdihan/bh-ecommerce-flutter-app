import 'package:batter_high/src/features/home/domain/model/product_list_response/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          if (product.image?.isNotEmpty == true)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image(
                  image: NetworkImage(product.image ?? ""),
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
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
                      (product.categories?.firstOrNull ?? "").toUpperCase(),
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
