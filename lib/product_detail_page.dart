import 'package:flutter/material.dart';



class Product {
  final String name;
  final String imagePath;
  final String price;
  final String description;

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
  });
}

// --- HALAMAN DETAIL PRODUK ---
class ProductDetailPage extends StatelessWidget {
  final Product product;

  // Menerima data produk saat halaman ini dipanggil
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Produk",
          style: TextStyle(fontFamily: 'SpaceGrotesk', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange, 
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- BAGIAN KIRI: GAMBAR PRODUK BESAR ---
            Expanded(
              flex: 1, 
              child: Hero(
                tag: product.imagePath, 
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            
            const SizedBox(width: 24), // Spasi pemisah antara gambar dan teks

            // --- BAGIAN KANAN: DESKRIPSI PRODUK ---
            Expanded(
              flex: 1, // Mengambil sisa 50% lebar layar
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.price,
                      style: const TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 22,
                        color: Colors.deepOrange, 
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Deskripsi",
                      style: TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 16,
                        height: 1.5, 
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Tombol Tambah ke Keranjang
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // TODO: Logika masukkan ke keranjang
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Dimasukkan ke keranjang!')),
                          );
                        },
                        child: const Text(
                          "Tambah ke Keranjang",
                          style: TextStyle(
                            fontFamily: 'SpaceGrotesk',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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