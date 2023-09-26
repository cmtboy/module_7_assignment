import 'package:flutter/material.dart';
import 'package:module_7_assignment/product_item.dart';

class CartScreen extends StatelessWidget {
  final List<Product> products;

  const CartScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final cart = Cart();
    for (var product in products) {
      if (product.counter > 0) {
        cart.items[product] = product.counter;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${cart.items.keys.length} Product in Cart"),
                  Text(
                    'Total: \$${cart.totalPrice}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          for (final product in cart.items.keys)
            ListTile(
              title: Text('${product.name} x${cart.items[product]}'),
              subtitle: Text('\$${(product.price * cart.items[product]!)}'),
            ),
        ],
      ),
    );
  }
}

class Cart {
  final Map<Product, int> items = {};

  double get totalPrice {
    double total = 0.0;
    items.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }
}
