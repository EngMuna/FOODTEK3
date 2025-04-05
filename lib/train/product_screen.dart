import 'package:flutter/material.dart';

import 'product.dart';


class ProductsScreen extends StatelessWidget {
  final Function( Product) onProductSelected;

  ProductsScreen({required this.onProductSelected});

  final List<Product> availableProducts = [
    Product(id: "1", name: "Apple", description: "Fresh red apple", price: 1.5, image: "https://via.placeholder.com/50"),
    Product(id: "2", name: "Banana", description: "Organic banana", price: 1.0, image: "https://via.placeholder.com/50"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Products")),
      body: ListView.builder(
        itemCount: availableProducts.length,
        itemBuilder: (context, index) {
          final product = availableProducts[index];

          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            trailing: ElevatedButton(
              onPressed: () {
                onProductSelected(product);
                Navigator.pop(context, product);
              },
              child: Text("Add"),
            ),
          );
        },
      ),
    );
  }
}
