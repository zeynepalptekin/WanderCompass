import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Cupertino ikonları için ekledik
import 'package:go_router/go_router.dart'; // Sayfalar arası geçiş için GoRouter ekledik
import '../widgets/bottom_menu.dart'; // Alt menü widget'ını import ettik

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Keşfetmek İstediğiniz Yeri Arayın", // Arama metni
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(
              CupertinoIcons.search, // Cupertino arama ikonu
              color: Colors.black, // İkon rengi siyah
            ),
            hintStyle: TextStyle(color: Colors.grey), // Hint metni rengi gri
          ),
          style: TextStyle(color: Colors.black), // Yazılacak metin rengi siyah
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // Son Keşifler kısmı
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Son Keşifler", // Başlık
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // İstanbul seçimi
                          context.go('/home'); // Home sayfasına yönlendir
                        },
                        child: Text("İstanbul",
                            style: TextStyle(
                                color: Colors.black)), // Yazıyı siyah yapıyoruz
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Paris seçimi
                          context.go('/home'); // Home sayfasına yönlendir
                        },
                        child: Text("Paris",
                            style: TextStyle(
                                color: Colors.black)), // Yazıyı siyah yapıyoruz
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Tokyo seçimi
                          context.go('/home'); // Home sayfasına yönlendir
                        },
                        child: Text("Tokyo",
                            style: TextStyle(
                                color: Colors.black)), // Yazıyı siyah yapıyoruz
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Şehirler listesi
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // İki sütun
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.0, // Simetrik görünüm
              ),
              delegate: SliverChildListDelegate(
                [
                  _buildCityCard(
                    context,
                    "İstanbul",
                    "Tarihin ve kültürün başkenti.",
                    "assets/images/istanbul.jpg", // Görselin yolu
                  ),
                  _buildCityCard(
                    context,
                    "Paris",
                    "Sanatın ve romantizmin şehri.",
                    "assets/images/paris.jpg", // Görselin yolu
                  ),
                  _buildCityCard(
                    context,
                    "Tokyo",
                    "Teknolojinin ve geleneklerin birleşimi.",
                    "assets/images/tokyo.jpg", // Görselin yolu
                  ),
                  _buildCityCard(
                    context,
                    "New York",
                    "Dünyanın kalbi, ışıklar şehri.",
                    "assets/images/newyork.jpg", // Görselin yolu
                  ),
                  _buildCityCard(
                    context,
                    "Barcelona",
                    "Mimari harikalar ve Akdeniz esintileri.",
                    "assets/images/barcelona.jpg", // Görselin yolu
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(), // Alt menüyü ekliyoruz
    );
  }

  // Şehir kartını oluşturan fonksiyon
  Widget _buildCityCard(
    BuildContext context,
    String title,
    String description,
    String imagePath,
  ) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              imagePath, // Görsel dosyasının yolu
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black, // Yazı rengini siyah yapıyoruz
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black, // Yazı rengini siyah yapıyoruz
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
