import 'package:flutter/material.dart';
import 'package:web/train/product_screen.dart';

import 'product.dart';

class CartScreeen extends StatefulWidget {
  @override
  _CartScreeenState createState() => _CartScreeenState();
}

class _CartScreeenState extends State<CartScreeen> {
  List<Product> cartItems = []; // قائمة المنتجات في السلة

  /// ✅ إضافة منتج إلى السلة
  void addToCart(Product product) {
    setState(() {
      var existingProduct = cartItems.firstWhere(
            (p) => p.id == product.id,
        orElse: () => Product(id: "", name: "", description: "", price: 0, image: ""),
      );

      if (existingProduct.id.isNotEmpty) {
        existingProduct.quantity++;
      } else {
        cartItems.add(product..quantity = 1);
      }
    });
  }

  /// ✅ إزالة منتج من السلة
  void removeFromCart(Product product) {
    setState(() {
      cartItems.removeWhere((p) => p.id == product.id);
    });
  }

  /// ✅ تقليل الكمية
  void decreaseQuantity(Product product) {
    setState(() {
      if (product.quantity > 1) {
        product.quantity--;
      } else {
        cartItems.remove(product);
      }
    });
  }

  /// ✅ زيادة الكمية
  void increaseQuantity(Product product) {
    setState(() {
      product.quantity++;
    });
  }

  /// ✅ حساب الفاتورة
  double get subTotal => cartItems.fold(0, (total, item) => total + (item.price * item.quantity));
  double get deliveryCharge => subTotal > 0 ? 5.0 : 0.0;
  double get discount => subTotal * 0.1;
  double get total => subTotal + deliveryCharge - discount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // زر إضافة المنتجات
          ElevatedButton(
            onPressed: () async {
              final selectedProduct = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsScreen(onProductSelected: addToCart),
                ),
              );
              if (selectedProduct != null) addToCart(selectedProduct);
            },
            child: Text("Add Products"),
          ),

          // التبويبات Cart / History
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _tabButton("Cart", true),
              _tabButton("History", false),
            ],
          ),

          // قائمة المنتجات في السلة
          Expanded(
            child: cartItems.isEmpty
                ? Center(child: Text("No items in the train"))
                : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(product.image, width: 50, height: 50),
                    title: Text(product.name),
                    subtitle: Text("${product.description}\n\$${product.price.toStringAsFixed(2)}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: Icon(Icons.remove), onPressed: () => decreaseQuantity(product)),
                        Text("${product.quantity}"),
                        IconButton(icon: Icon(Icons.add), onPressed: () => increaseQuantity(product)),
                        IconButton(icon: Icon(Icons.delete, color: Colors.orange), onPressed: () => removeFromCart(product)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // الفاتورة النهائية
          _orderSummary(),
        ],
      ),
    );
  }

  Widget _tabButton(String title, bool isActive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 18, color: isActive ? Colors.green : Colors.grey)),
          if (isActive) Container(height: 3, width: 50, color: Colors.green),
        ],
      ),
    );
  }

  Widget _orderSummary() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      child: Column(
        children: [
          _summaryRow("Sub-Total", subTotal),
          _summaryRow("Delivery Charge", deliveryCharge),
          _summaryRow("Discount", -discount),
          Divider(),
          _summaryRow("Total", total, isTotal: true),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order Placed!")));
            },
            child: Text("Place My Order"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: isTotal ? 18 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: Colors.white)),
          Text("\$${amount.toStringAsFixed(2)}", style: TextStyle(fontSize: isTotal ? 18 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: Colors.white)),
        ],
      ),
    );
  }
}
