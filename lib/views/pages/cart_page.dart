
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

// Halaman untuk menampilkan isi keranjang belanja.
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer memperbarui tampilan ketika data keranjang berubah.
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        // Scaffold sebagai struktur utama halaman.
        return Scaffold(
          // AppBar sebagai header keranjang.
          appBar: AppBar(
            title: const Text(
              'Keranjang Belanja',
              style: TextStyle(
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),

          // Menampilkan pesan jika keranjang kosong.
          body: cart.items.isEmpty
              ? const Center(
                  child: Text(
                    'Keranjang Anda masih kosong.',
                    style: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontSize: 18,
                    ),
                  ),
                )

              // ListView menampilkan semua produk di keranjang.
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];

                    // Card untuk setiap produk di keranjang.
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            // Gambar produk.
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.product.imagePath,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 16),

                            // Informasi produk dan tombol kuantitas.
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  // Nama produk.
                                  Text(
                                    item.product.name,
                                    style: const TextStyle(
                                      fontFamily: 'Space Grotesk',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  // Harga produk.
                                  Text(
                                    item.product.price,
                                    style: const TextStyle(
                                      fontFamily: 'Space Grotesk',
                                      color: Colors.deepOrange,
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  // Tombol untuk mengatur jumlah produk.
                                  Row(
                                    children: [
                                      // Mengurangi kuantitas produk.
                                      IconButton(
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                        ),
                                        onPressed: () {
                                          cart.decreaseQuantity(
                                            item.product,
                                          );
                                        },
                                      ),

                                      // Jumlah produk.
                                      Text(
                                        '${item.quantity}',
                                        style: const TextStyle(
                                          fontFamily: 'Space Grotesk',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // Menambah kuantitas produk.
                                      IconButton(
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                        ),
                                        onPressed: () {
                                          cart.addToCart(item.product);
                                        },
                                      ),

                                      const Spacer(),

                                      // Menghapus produk dari keranjang.
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          cart.removeFromCart(
                                            item.product,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}