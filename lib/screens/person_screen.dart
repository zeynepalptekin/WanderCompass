import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';
import 'package:provider/provider.dart'; // Provider'ı dahil edin

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ThemeProvider'ı burada doğru şekilde kullanıyoruz
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.moon),
            onPressed: () {
              themeProvider.toggleTheme(); // Tema değişikliği
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(255, 22, 37, 63),
                    child: Text(
                      "ZA",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ListTile(
                    leading: Icon(Icons.person, color: Colors.black),
                    title: Text(
                      "Zeynep Alptekin",
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      "Ad Soyad",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.email, color: Colors.black),
                    title: Text(
                      "zeynep.alptekin@live.com",
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      "E-posta",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              // Hesaptan çıkış yapacak fonksiyonu buraya ekleyebilirsiniz
            },
            icon: const Icon(Icons.logout),
            label: const Text("Hesaptan Çıkış Yap"),
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color(0xFF80CBC4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () {
              context.go("/home"); // Ana sayfaya gitmek için
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            label: const Text(
              "Geri Dön",
              style: TextStyle(color: Colors.black),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color(0xFFF0F4F8),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
