// Model untuk menyimpan informasi setiap produk.
class Product {
  final String name;
  final String imagePath;
  final String price;
  final String description;

  const Product({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
  });
}