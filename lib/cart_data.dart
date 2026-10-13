import 'models/product.dart';

// Model untuk item di dalam keranjang.
class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

// Variabel global keranjang lama.
// Tidak digunakan lagi jika seluruh aplikasi sudah menggunakan Provider.
List<CartItem> globalCart = [];