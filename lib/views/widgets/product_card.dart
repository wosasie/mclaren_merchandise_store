import 'package:flutter/material.dart';
// IMPORT HALAMAN DETAIL
import '../../product_detail_page.dart'; // Sesuaikan path jika folder Anda berbeda

// widget untuk menampilkan satu card merchandise.
class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    // 1. BUNGKUS DENGAN GestureDetector AGAR BISA DI-KLIK
    return GestureDetector(
      onTap: () {
        // 2. LOGIKA NAVIGASI KE HALAMAN DETAIL
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              product: Product(
                name: productName,
                imagePath: imagePath,
                price: price,
                // Karena data deskripsi belum ada di list utama, kita buat dummy sementara
                description: "Ini adalah merchandise resmi dari McLaren Racing. Dibuat dengan material berkualitas tinggi untuk memberikan kenyamanan maksimal meski panas dan terlepas dari nama dan warna team nya",
              ),
            ),
          ),
        );
      },
      // container ini sebagai card produk.
      child: Container(
        padding: const EdgeInsets.all(10),
        // BoxDecoration untuk memberikan background dan border.
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        // column untuk menyusun gambar, nama, dan harga.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 3. TAMBAHKAN HERO ANIMATION PADA GAMBAR
            Hero(
              tag: imagePath, // Tag harus sama dengan yang ada di halaman detail
              child: Container(
                height: 190,
                width: double.infinity,
                // BoxDecoration untuk mengatur gambar produk.
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  // DecorationImage untuk mengambil gambar dari assets.
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // SizedBox untuk memberikan jarak antara gambar dan nama.
            const SizedBox(height: 12),
            // text untuk menampilkan nama merchandise.
            Text(
              productName,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            // SizedBox untuk memberikan jarak sebelum harga.
            const SizedBox(height: 6),
            // text untuk menampilkan harga merchandise.
            Text(
              price,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}