import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  ProductItemState createState() => ProductItemState();
}

class ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product.name),
      subtitle: Text('\$${widget.product.price}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Quantity: ${widget.product.counter}'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.product.counter++;
                if (widget.product.counter == 5) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Congratulations!'),
                        content:
                            Text('You\'ve bought 5 ${widget.product.name}!'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
            child: const Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});
}

final List<Product> products = [
  Product(name: 'T-Shirt', price: 699),
  Product(name: 'Mobile', price: 999),
  Product(name: 'Tablet', price: 399),
  Product(name: 'Headphones', price: 149),
  Product(name: 'Mouse', price: 499),
  Product(name: 'Smart Watch', price: 199),
  Product(name: 'Bluetooth Speaker', price: 79),
  Product(name: 'Gaming Console', price: 299),
  Product(name: 'TV', price: 699),
  Product(name: 'Wireless Adapter', price: 29),
];
