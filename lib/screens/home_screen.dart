import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../core/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tema kontrolü
    final isDarkMode = Provider.of<ThemeProvider>(context).isDark;

    return Scaffold(
      // Temaya göre arka plan rengi
      backgroundColor: isDarkMode
          ? const Color.fromARGB(255, 20, 34, 46) // Koyu tema için arka plan
          : const Color.fromARGB(
              230, 250, 252, 253), // Açık tema için arka plan

      // AppBar
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? const Color.fromARGB(255, 20, 34, 46) // Koyu tema için
            : const Color.fromARGB(230, 250, 252, 253), // Açık tema için
        title: const Text(
          'WanderCompass',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        backgroundColor: isDarkMode
            ? const Color.fromARGB(255, 20, 34, 46) // Koyu tema için
            : Colors.white, // Açık tema için
        elevation: 0,
        child: Column(
          children: [
            // Drawer Header
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.black87,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Kullanıcı Adı',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text('Arama'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.photo),
              title: const Text('Fotoğraflar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.book),
              title: const Text('Blog Yazıları'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.bookmark),
              title: const Text('Kaydedilenler'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.airplane),
              title: const Text('Seyahatlerim'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.location),
              title: const Text('Konum'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.mail),
              title: const Text('İletişim'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.circle_bottomthird_split),
              title: const Text('Gece/Gündüz Modu'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Ana içerik
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: DotLottieLoader.fromAsset("assets/motions/q.lottie",
                    frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                  if (dotlottie != null) {
                    return Lottie.memory(dotlottie.animations.values.single);
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          ),
        ],
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.go("/home");
              },
              icon: Icon(CupertinoIcons.home),
            ),
            IconButton(
              onPressed: () {
                context.go("/search");
              },
              icon: Icon(CupertinoIcons.search),
            ),
            IconButton(
              onPressed: () {
                context.go("/map");
              },
              icon: Icon(CupertinoIcons.map),
            ),
            IconButton(
              onPressed: () {
                context.go("/camera");
              },
              icon: Icon(CupertinoIcons.camera),
            ),
            IconButton(
              onPressed: () {
                context.go("/person");
              },
              icon: Icon(CupertinoIcons.person),
            ),
          ],
        ),
      ),
    );
  }
}
