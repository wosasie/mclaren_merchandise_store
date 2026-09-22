import 'package:flutter/material.dart';

// widget header untuk halaman utama pada aplikasi.
class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // container digunakan untuk area header.
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),

      // BoxDecoration berfungsi untuk memberikan background hitam.
      decoration: const BoxDecoration(
        color: Colors.black,
      ),

      // row untuk menyusun isi header secara horizontal.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // text ini untuk menampilkan nama brand.
          const Text(
            'McLaren',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),

          // row untuk menempatkan icon di sisi kanan.
          Row(
            children: [
              // icon untuk icon pencarian.
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 24,
              ),

              // SizedBox untuk memberikan jarak antar icon.
              const SizedBox(width: 18),

              // icon ini untuk icon keranjang belanja.
              const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}