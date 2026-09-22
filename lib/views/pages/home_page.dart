import 'package:flutter/material.dart';

import '../widgets/app_header.dart';
import '../widgets/search_bar.dart';
import '../widgets/hero_banner.dart';
import '../widgets/section_title.dart';
import '../widgets/product_card.dart';

// halaman utama McLaren Merchandise Store.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // list untuk menyimpan data merchandise.
  static const List<Map<String, String>> products = [
    {
      'name': 'McLaren Team T-Shirt',
      'price': 'Rp800.000',
      'image': 'assets/images/tshirt.jpg',
    },
    {
      'name': 'McLaren Racing Cap',
      'price': 'Rp500.000',
      'image': 'assets/images/cap.jpg',
    },
    {
      'name': 'McLaren Team Hoodie',
      'price': 'Rp1.000.000',
      'image': 'assets/images/hoodie.jpg',
    },
    {
      'name': 'McLaren Racing Jacket',
      'price': 'Rp1.600.000',
      'image': 'assets/images/jacket.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // scaffold sebagai struktur dasar halaman.
    return Scaffold(
      // safeArea agar konten tidak tertutup dengan area perangkat.
      body: SafeArea(
        // SingleChildScrollView agar halaman dapat di-scroll.
        child: SingleChildScrollView(
          // column untuk menyusun seluruh bagian homepage.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppHeader sebagai header aplikasi.
              const AppHeader(),

              // SizedBox untuk memberikan jarak setelah header.
              const SizedBox(height: 24),

              // McLarenSearchBar sebagai search bar.
              const McLarenSearchBar(),

              // SizedBox untuk memberikan jarak.
              const SizedBox(height: 24),

              // HeroBanner sebagai banner utama.
              const HeroBanner(),

              // SizedBox untuk memberikan jarak.
              const SizedBox(height: 36),

              // SectionTitle untuk judul featured collection.
              const SectionTitle(
                title: 'FEATURED COLLECTION',
                subtitle: '4 ITEMS',
              ),

              // SizedBox untuk memberikan jarak sebelum produk.
              const SizedBox(height: 16),

              // padding untuk memberikan jarak grid produk.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                // row untuk menyusun dua produk secara horizontal.
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // expanded untuk membagi ruang produk pertama.
                    Expanded(
                      child: ProductCard(
                        imagePath: products[0]['image']!,
                        productName: products[0]['name']!,
                        price: products[0]['price']!,
                      ),
                    ),

                    // SizedBox untuk memberikan jarak antar produk.
                    const SizedBox(width: 12),

                    // expanded untuk membagi ruang produk kedua.
                    Expanded(
                      child: ProductCard(
                        imagePath: products[1]['image']!,
                        productName: products[1]['name']!,
                        price: products[1]['price']!,
                      ),
                    ),
                  ],
                ),
              ),

              // SizedBox untuk memberikan jarak antar baris produk.
              const SizedBox(height: 16),

              // padding untuk memberikan jarak grid produk.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                // row untuk menyusun dua produk secara horizontal.
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // expanded untuk membagi ruang produk ketiga.
                    Expanded(
                      child: ProductCard(
                        imagePath: products[2]['image']!,
                        productName: products[2]['name']!,
                        price: products[2]['price']!,
                      ),
                    ),

                    // SizedBox untuk memberikan jarak antar produk.
                    const SizedBox(width: 12),

                    // expanded untuk membagi ruang produk keempat.
                    Expanded(
                      child: ProductCard(
                        imagePath: products[3]['image']!,
                        productName: products[3]['name']!,
                        price: products[3]['price']!,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // SectionTitle digunakan untuk judul merchandise terbaru.
              const SectionTitle(
                title: 'LATEST MERCHANDISE',
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                // container sebagai informasi koleksi terbaru.
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  // BoxDecoration untuk mengatur tampilan container.
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.orange.shade200,
                    ),
                  ),

                  child: Row(
                    children: [
                      // container sebagai area icon.
                      Container(
                        width: 64,
                        height: 64,

                        // BoxDecoration untuk memberikan background hitam.
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),

                        // icon untuk menampilkan icon merchandise.
                        child: const Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '2026 Team Collection',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            // text untuk deskripsi koleksi.
                            Text(
                              'Discover the latest McLaren Racing merchandise.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // SizedBox ini untuk memberikan jarak sebelum footer.
              const SizedBox(height: 40),

              // container sebagai footer aplikasi.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),

                // BoxDecoration untuk memberikan background footer.
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),

                // column untuk menyusun isi footer.
                child: const Column(
                  children: [
                    // text untuk nama aplikasi.
                    Text(
                      'McLAREN MERCHANDISE STORE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // SizedBox untuk memberikan jarak.
                    SizedBox(height: 8),

                    // text untuk keterangan aplikasi.
                    Text(
                      'Official Racing Collection',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}