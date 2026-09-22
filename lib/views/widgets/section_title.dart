import 'package:flutter/material.dart';

// widget untuk menampilkan judul setiap section homepage.
class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    // padding untuk ngasih jarak judul dari sisi layar.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      // row ini untuk menyusun judul dan subtitle secara horizontal.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // text untuk menampilkan judul section.
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),

          // text untuk menampilkan jumlah item kalau tersedia.
          if (subtitle != null)
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
        ],
      ),
    );
  }
}