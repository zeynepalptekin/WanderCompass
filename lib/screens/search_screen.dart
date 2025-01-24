import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Arama",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Aramak istediğiniz şeyi yazın...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  contentPadding: const EdgeInsets.all(16),
                ),
                onChanged: (value) {
                  // Kullanıcı girdisini işleme
                  // ignore: avoid_print
                  print("Arama girdisi: $value");
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Popüler Aramalar",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildSearchSuggestion("Popüler Seyahat Noktaları"),
                  _buildSearchSuggestion("Yakındaki Restoranlar"),
                  _buildSearchSuggestion("Doğa Yürüyüşü Rotaları"),
                  _buildSearchSuggestion("En İyi Plajlar"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Popüler arama kartı
  Widget _buildSearchSuggestion(String suggestion) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ListTile(
          leading: const Icon(
            Icons.trending_up,
            color: Colors.blueAccent,
          ),
          title: Text(
            suggestion,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
          onTap: () {
            // Tıklandığında bir işlem yapılabilir
            // ignore: avoid_print
            print("Tıklanan öneri: $suggestion");
          },
        ),
      ),
    );
  }
}
