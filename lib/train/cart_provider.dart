import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  final List<Product> _availableProducts = [
    Product(name: "Spicy Shawarma", description: "Hot Cool Spot", image: "https://via.placeholder.com/50", price: 15, id: ''),
    Product(name: "Chicken Burger", description: "Burger Factory LTD", image: "https://via.placeholder.com/50", price: 20, id: ''),
    Product(name: "Onion Pizza", description: "Pizza Palace", image: "https://via.placeholder.com/50", price: 15, id: ''),
  ];

  List<Product> get cartItems => _cartItems;
  List<Product> get availableProducts => _availableProducts;

  double get subTotal => _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get deliveryCharge => 10;
  double get discount => 10;
  double get total => subTotal + deliveryCharge - discount;

  void addToCart(Product product) {
    var existingProduct = _cartItems.firstWhere(
            (p) => p.name == product.name,
        orElse: () => Product(name: '', description: '', image: '', price: 0, id: ''));

    if (existingProduct.name.isNotEmpty) {
      existingProduct.quantity++;
    } else {
      _cartItems.add(Product(
        name: product.name,
        description: product.description,
        image: product.image,
        price: product.price,
        quantity: 1, id: '',
      ));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.name == product.name);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      removeFromCart(product);
    }
    notifyListeners();
  }
}
