import 'package:flutter/material.dart';

// widget search bar untuk mencari merchandise.
class McLarenSearchBar extends StatelessWidget {
  const McLarenSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    // padding untuk memberikan jarak search bar dari sisi layar.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      // TextField berfungsi untuk input pencarian.
      child: TextField(
        decoration: InputDecoration(
          // hintText ini untuk memberikan petunjuk pencarian.
          hintText: 'Search merchandise...',

          // hintStyle untuk mengatur tampilan hint.
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
          ),

          // suffixIcon untuk menampilkan icon pencarian.
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),

          // OutlineInputBorder untuk membuat garis tepi.
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),

          // mengatur garis tepi waktu TextField tidak pakai.
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}