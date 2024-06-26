import 'package:flutter/material.dart';

import '../widgets/custom_title.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.title});

  final String title;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CustomTitle(
                title: "Cart",
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ...List.generate(5,
                      // add list tile
                      (index) {
                    return ListTile(
                      leading: const Icon(Icons.lock),
                      title: const Text('Product 1'),
                      subtitle: const Text('Price: 100'),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        // Quantity and + -  button to change quantity
                        children: [
                          const Text('Quantity: 1'),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  ListTile(
                      leading: const Icon(Icons.lock),
                      title: const Text('Product 1'),
                      subtitle: const Text('Price: 100'),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        // Quantity and + -  button to change quantity
                        children: [
                          const Text('Quantity: 1'),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
