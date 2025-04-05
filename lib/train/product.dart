////class Product {
//   final String name;
//   final String description;
//   final String image;
//   final double price;
//   int quantity;
//
//   Product({
//     required this.name,
//     required this.description,
//     required this.image,
//     required this.price,
//     this.quantity = 1,
//   });
// }
class Product {
  final String id, name, description, image;
  final double price;
  int quantity;

  Product({required this.id, required this.name, required this.description, required this.price, required this.image, this.quantity = 0});
}
