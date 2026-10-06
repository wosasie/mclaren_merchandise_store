// lib/cart_data.dart
import 'product_detail_page.dart';

// Model untuk item di dalam keranjang
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

// Variabel global untuk menyimpan daftar belanjaan
List<CartItem> globalCart = [];