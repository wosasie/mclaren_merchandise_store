import 'package:flutter/material.dart';
import 'cart_data.dart'; // Import keranjang global kita

// --- MODEL DATA PRODUK ---
class Product {
  final String name;
  final String imagePath;
  final String price;
  final String description;

  Product({required this.name, required this.imagePath, required this.price, required this.description});
}

// --- HALAMAN DETAIL (Sekarang menjadi StatefulWidget) ---
class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  
  // Fungsi untuk menambah barang ke keranjang
  void _addToCart() {
    setState(() {
      // Cek apakah barang sudah ada di keranjang
      int existingIndex = globalCart.indexWhere((item) => item.product.name == widget.product.name);

      if (existingIndex != -1) {
        // Jika sudah ada, tambah kuantitasnya saja
        globalCart[existingIndex].quantity++;
      } else {
        // Jika belum ada, masukkan sebagai barang baru
        globalCart.add(CartItem(product: widget.product, quantity: 1));
      }
    });

    // Munculkan notifikasi sukses
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.name} dimasukkan ke keranjang!'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk", style: TextStyle(fontFamily: 'SpaceGrotesk', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- KIRI: GAMBAR ---
            Expanded(
              flex: 1,
              child: Hero(
                tag: widget.product.imagePath, // Perhatikan penggunaan widget.product
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(widget.product.imagePath, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(width: 24),

            // --- KANAN: DESKRIPSI ---
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.name, style: const TextStyle(fontFamily: 'SpaceGrotesk', fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(widget.product.price, style: const TextStyle(fontFamily: 'SpaceGrotesk', fontSize: 22, color: Colors.deepOrange, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 24),
                    const Text("Deskripsi", style: TextStyle(fontFamily: 'SpaceGrotesk', fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(widget.product.description, style: const TextStyle(fontFamily: 'SpaceGrotesk', fontSize: 16, height: 1.5)),
                    const SizedBox(height: 32),
                    
                    // Tombol Tambah ke Keranjang
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: _addToCart, // Panggil fungsi di atas saat diklik
                        child: const Text("Tambah ke Keranjang", style: TextStyle(fontFamily: 'SpaceGrotesk', color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}