import 'package:flutter/material.dart';
import 'views/pages/home_page.dart';

void main() {
  runApp(const McLarenStoreApp());
}

// widget utama aplikasi mcLaren merchandise store.
class McLarenStoreApp extends StatelessWidget {
  const McLarenStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    // materialApp berfungsi sebagai wrapper utama aplikasi.
    return MaterialApp(
      title: 'McLaren Merchandise Store',

      // menghilangkan label DEBUG pada aplikasi.
      debugShowCheckedModeBanner: false,

      // ThemeData berfungsi untuk mengatur tema aplikasi.
      theme: ThemeData(
        // memakai font Space Grotesk untuk seluruh aplikasi.
        fontFamily: 'Space Grotesk',

        // mengatur warna utama aplikasi.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),

        // mengatur warna background halaman.
        scaffoldBackgroundColor: Colors.white,
      ),

      // menampilkan HomePage sebagai halaman utama.
      home: const HomePage(),
    );
  }
}

