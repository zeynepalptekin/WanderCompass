import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Seyahat önerileri listesi
    final List<Map<String, String>> travelDestinations = [
      {
        "title": "Kapadokya",
        "subtitle": "Türkiye'nin büyüleyici peri bacaları",
        "image": "assets/images/kapadokya.jpg",
      },
      {
        "title": "Kültür Turu",
        "subtitle": "İtalya'nın tarihi güzellikleri",
        "image": "assets/images/italya.jpg",
      },
      {
        "title": "Kiraz Çiçekleri",
        "subtitle": "Güney Kore'de baharın muhteşem renkleri",
        "image": "assets/images/kore.jpg",
      },
      {
        "title": "Kuzey Işıkları",
        "subtitle": "Norveç'te doğanın büyüleyici ışık gösterisi",
        "image": "assets/images/norvec.jpg",
      },
    ];

    final theme = Theme.of(context); // Tema verilerini buradan alıyoruz

    return Scaffold(
      backgroundColor: theme.colorScheme.background, // Tema arka plan rengi
      appBar: AppBar(
        backgroundColor: theme.primaryColor, // Tema birincil renk
        elevation: 0,
        title: Text(
          "Seyahat Rotası Önerileri",
          style: TextStyle(
            color: theme.appBarTheme.titleTextStyle?.color ??
                const Color.fromARGB(255, 8, 8, 8), // Tema renklerine göre yazı
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: theme.iconTheme.color ?? Colors.white), // Tema icon rengi
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: travelDestinations.length,
                itemBuilder: (context, index) {
                  final destination = travelDestinations[index];
                  return _buildTravelCard(
                    context: context, // context'i geçiyoruz
                    title: destination["title"]!,
                    subtitle: destination["subtitle"]!,
                    imagePath: destination["image"]!,
                  );
                },
              ),
            ),
          ),
          // BottomMenu widget'ı burada kullanılıyor
          const BottomMenu(),
        ],
      ),
    );
  }

  Widget _buildTravelCard({
    required BuildContext context, // context parametresi eklendi
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    final theme = Theme.of(context); // Tema verilerini burada da alıyoruz

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor, // Tema kart rengi
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Şehir Görseli
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            // Başlık ve Alt Başlık
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: theme
                          .textTheme.titleLarge?.color, // Tema başlık rengi
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          theme.textTheme.bodyMedium?.color, // Tema metin rengi
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
                    print("Daha fazla bilgi için: $title");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        theme.colorScheme.secondary, // Tema vurgulama rengi
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Daha Fazla",
                    style: TextStyle(
                      color: theme.textTheme.labelLarge?.color ??
                          Colors.white, // Tema buton yazı rengi
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
