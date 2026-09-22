import 'package:flutter/material.dart';

// widget hero banner untuk menampilkan promosi utama.
class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    // container berfungsi untuk area utama hero banner.
    return Container(
      width: double.infinity,
      height: 420,
      margin: const EdgeInsets.symmetric(horizontal: 20),

      // BoxDecoration ini untuk mengatur background dan gambar.
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        // DecorationImage untuk menampilkan gambar hero.
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/hero.jpg',
          ),
          fit: BoxFit.cover,

          // agar memberikan efek gelap jadinya teks lebih mudah dibaca.
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.darken,
          ),
        ),
      ),

      // padding untuk memberikan jarak isi banner.
      child: Padding(
        padding: const EdgeInsets.all(24),

        // column ini untuk menyusun isi banner secara vertikal.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // text untuk menampilkan label koleksi.
            const Text(
              'McLAREN RACING',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),

            // SizedBox buat ngasih jarak.
            const SizedBox(height: 10),

            // text untuk menampilkan judul utama.
            const Text(
              'OFFICIAL\nMERCHANDISE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
                height: 1.05,
              ),
            ),

            const SizedBox(height: 10),

            // text untuk menampilkan deskripsi singkat.
            const Text(
              'McLaren Racing Collection',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),

            // SizedBox ini buat kasih jarak sebelum tombol.
            const SizedBox(height: 18),

            // container ini untuk tombol visual SHOP NOW.
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),

              // BoxDecoration untuk memberikan background tombol.
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),

              // text untuk menampilkan tulisan tombol.
              child: const Text(
                'SHOP NOW',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}