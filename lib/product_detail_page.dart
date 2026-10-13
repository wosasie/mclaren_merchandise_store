
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/product.dart';
import 'providers/cart_provider.dart';

// Halaman detail produk.
class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() =>
      _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // Menambahkan produk ke keranjang menggunakan Provider.
  void _addToCart() {
    context.read<CartProvider>().addToCart(widget.product);

    // Menampilkan notifikasi setelah produk ditambahkan.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${widget.product.name} dimasukkan ke keranjang!',
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai struktur utama halaman detail.
    return Scaffold(
      // AppBar sebagai header halaman detail.
      appBar: AppBar(
        title: const Text(
          'Detail Produk',
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),

      // Padding untuk memberikan jarak pada konten.
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // Row untuk menyusun gambar dan deskripsi secara horizontal.
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded untuk area gambar produk.
            Expanded(
              flex: 1,

              // Hero untuk animasi perpindahan gambar.
              child: Hero(
                tag: widget.product.imagePath,

                // ClipRRect untuk membuat sudut gambar membulat.
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),

                  // Image.asset untuk menampilkan gambar produk.
                  child: Image.asset(
                    widget.product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // SizedBox untuk jarak antara gambar dan deskripsi.
            const SizedBox(width: 24),

            // Expanded untuk area informasi produk.
            Expanded(
              flex: 1,

              // SingleChildScrollView agar deskripsi dapat di-scroll.
              child: SingleChildScrollView(
                // Column untuk menyusun informasi secara vertikal.
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text untuk menampilkan nama produk.
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Text untuk menampilkan harga produk.
                    Text(
                      widget.product.price,
                      style: const TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 22,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Judul bagian deskripsi.
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Text untuk menampilkan deskripsi produk.
                    Text(
                      widget.product.description,
                      style: const TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // SizedBox untuk mengatur ukuran tombol.
                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      // ElevatedButton untuk menambahkan produk ke keranjang.
                      child: ElevatedButton(
                        // Mengatur tampilan tombol.
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        // Menjalankan fungsi ketika tombol ditekan.
                        onPressed: _addToCart,

                        // Text sebagai label tombol.
                        child: const Text(
                          'Tambah ke Keranjang',
                          style: TextStyle(
                            fontFamily: 'Space Grotesk',
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