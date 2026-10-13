
import 'package:flutter/material.dart';
import '../models/product.dart';

// Model untuk menyimpan produk dan jumlahnya di keranjang.
class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

// Provider untuk mengelola seluruh data keranjang.
class CartProvider extends ChangeNotifier {
  // Daftar produk yang sudah ditambahkan ke keranjang.
  final List<CartItem> _items = [];

  // Mengambil daftar item keranjang.
  List<CartItem> get items => List.unmodifiable(_items);

  // Menghitung jumlah seluruh barang di keranjang.
  int get totalItems =>
      _items.fold(0, (total, item) => total + item.quantity);

  // Mengubah harga seperti Rp1.000.000 menjadi angka.
  int _parsePrice(String price) {
    return int.tryParse(price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
  }

  // Menghitung total harga semua barang.
  int get grandTotal => _items.fold(
        0,
        (total, item) =>
            total + _parsePrice(item.product.price) * item.quantity,
      );

  // Menambahkan produk atau menaikkan jumlah jika sudah ada.
  void addToCart(Product product) {
    final index =
        _items.indexWhere((item) => item.product.name == product.name);

    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }

    // Memberi tahu widget yang mendengarkan Provider.
    notifyListeners();
  }

  // Mengurangi jumlah produk di keranjang.
  void decreaseQuantity(Product product) {
    final index =
        _items.indexWhere((item) => item.product.name == product.name);

    if (index == -1) return;

    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index);
    }

    notifyListeners();
  }

  // Menghapus produk dari keranjang.
  void removeFromCart(Product product) {
    _items.removeWhere((item) => item.product.name == product.name);
    notifyListeners();
  }
}