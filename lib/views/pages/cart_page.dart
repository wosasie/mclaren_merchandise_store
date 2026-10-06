import 'package:flutter/material.dart';
import '../../cart_data.dart'; 

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Fungsi tambah kuantitas
  void _increaseQuantity(int index) {
    setState(() {
      globalCart[index].quantity++;
    });
  }

  // Fungsi kurangi kuantitas
  void _decreaseQuantity(int index) {
    setState(() {
      if (globalCart[index].quantity > 1) {
        globalCart[index].quantity--;
      }
    });
  }

  // Fungsi hapus produk
  void _removeItem(int index) {
    setState(() {
      globalCart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Belanja", style: TextStyle(fontFamily: 'SpaceGrotesk', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      // Cek apakah keranjang kosong
      body: globalCart.isEmpty
          ? const Center(
              child: Text("Keranjang Anda masih kosong.", style: TextStyle(fontFamily: 'SpaceGrotesk', fontSize: 18)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: globalCart.length,
              itemBuilder: (context, index) {
                final item = globalCart[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        // Gambar Produk di Keranjang
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(item.product.imagePath, width: 80, height: 80, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 16),
                        
                        // Detail & Tombol
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.product.name, style: const TextStyle(fontFamily: 'SpaceGrotesk', fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 4),
                              Text(item.product.price, style: const TextStyle(fontFamily: 'SpaceGrotesk', color: Colors.deepOrange)),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  // Tombol Kurang (-)
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline),
                                    onPressed: () => _decreaseQuantity(index), // Panggil fungsi kurang
                                  ),
                                  // Teks Kuantitas
                                  Text('${item.quantity}', style: const TextStyle(fontFamily: 'SpaceGrotesk', fontSize: 18, fontWeight: FontWeight.bold)),
                                  // Tombol Tambah (+)
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () => _increaseQuantity(index), // Panggil fungsi tambah
                                  ),
                                  const Spacer(),
                                  // Tombol Hapus (Tong Sampah)
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => _removeItem(index), // Panggil fungsi hapus
                                  ),
                                ],
                              )
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
  }
}