import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Seyahat önerileri listesi
    final List<Map<String, String>> travelDestinations = [
      {
        "title": "Kapadokya",
        "subtitle": "Türkiye'nin büyüleyici peri bacaları",
      },
      {
        "title": "Kültür Turu",
        "subtitle": "İtalya'nın tarihi güzellikleri",
      },
      {
        "title": "Kiraz Çiçekleri",
        "subtitle": "Güney Kore'de baharın muhteşem renkleri",
      },
      {
        "title": "Kuzey Işıkları",
        "subtitle": "Norveç'te doğanın büyüleyici ışık gösterisi",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 141, 193, 218),
        elevation: 0,
        title: const Text(
          "Seyahat Rotası Önerileri",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: travelDestinations.length,
          itemBuilder: (context, index) {
            final destination = travelDestinations[index];
            return _buildTravelCard(
              title: destination["title"]!,
              subtitle: destination["subtitle"]!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildTravelCard({
    required String title,
    required String subtitle,
  }) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Başlık ve Alt Başlık
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            // "Daha Fazla" Butonu
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 12.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Daha fazla bilgi veya detay sayfasına yönlendirme
                    // ignore: avoid_print
                    print("Daha fazla bilgi için: $title");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF80CBC4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Daha Fazla",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
