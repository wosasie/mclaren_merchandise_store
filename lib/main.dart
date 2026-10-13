
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/pages/home_page.dart';
import 'providers/cart_provider.dart';

// Widget utama aplikasi McLaren Merchandise Store.
class McLarenStoreApp extends StatelessWidget {
  const McLarenStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider menyediakan state untuk seluruh halaman.
    return MultiProvider(
      providers: [
        // Membuat dan menyediakan pengelola keranjang.
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      // MaterialApp menjadi wrapper utama aplikasi.
      child: MaterialApp(
        title: 'McLaren Merchandise Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Space Grotesk',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        // Menampilkan homepage sebagai halaman awal.
        home: const HomePage(),
      ),
    );
  }
}

void main() {
  runApp(const McLarenStoreApp());
}