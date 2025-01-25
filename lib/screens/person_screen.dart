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

    // Gece ve gündüz modunu kontrol et
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        backgroundColor: isDarkMode
            ? Theme.of(context).colorScheme.primary // Gece modunda başlık rengi
            : const Color.fromARGB(255, 135, 174, 199), // Gündüz modunda beyaz
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.moon, // Gece modundaki ikon
              color: isDarkMode
                  ? Colors.white
                  : Colors.black, // Gece/gündüz modu ikon rengi
            ),
            onPressed: () {
              themeProvider.toggleTheme(); // Tema değişikliği
            },
          ),
        ],
      ),
      body: Container(
        color: isDarkMode
            ? const Color.fromARGB(
                255, 20, 34, 46) // Gece modunda verdiğiniz renk
            : const Color.fromARGB(255, 135, 174, 199), // Gündüz modunda beyaz
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: isDarkMode
                  ? const Color.fromARGB(221, 42, 52, 61)
                  : Colors.grey[300], // Gündüz modunda açık gri
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: isDarkMode
                          ? const Color.fromARGB(221, 19, 68, 112)
                          : const Color.fromARGB(221, 19, 68, 112), // Soft mavi
                      child: Text(
                        "ZA",
                        style: TextStyle(
                          fontSize: 24,
                          color: isDarkMode
                              ? Colors.white
                              : Colors.white, // Metin rengi değişiyor
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: Icon(Icons.person,
                          color: isDarkMode ? Colors.white : Colors.black),
                      title: Text(
                        "Zeynep Alptekin",
                        style: TextStyle(
                            color: isDarkMode
                                ? Colors.white
                                : Colors.black), // Metin rengi
                      ),
                      subtitle: Text(
                        "Ad Soyad",
                        style: TextStyle(
                            color: isDarkMode
                                ? Colors.white70
                                : Colors.black54), // Metin rengi
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email,
                          color: isDarkMode ? Colors.white : Colors.black),
                      title: Text(
                        "zeynep.alptekin@live.com",
                        style: TextStyle(
                            color: isDarkMode
                                ? Colors.white
                                : Colors.black), // Metin rengi
                      ),
                      subtitle: Text(
                        "E-posta",
                        style: TextStyle(
                            color: isDarkMode
                                ? Colors.white70
                                : Colors.black54), // Metin rengi
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Hesaptan çıkış için buton
            FilledButton.icon(
              onPressed: () {
                // Hesaptan çıkış yapacak fonksiyonu buraya ekleyebilirsiniz
              },
              icon: const Icon(Icons.logout),
              label: Text(
                "Hesaptan Çıkış Yap",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.white, // Yazı rengi
                ),
              ),
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: isDarkMode
                    ? const Color.fromARGB(
                        221, 19, 68, 112) // Gece modunda koyu renk
                    : const Color.fromARGB(
                        221, 19, 68, 112), // Gündüz modunda mavi
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Geri dön butonu
            TextButton.icon(
              onPressed: () {
                context.go("/home"); // Ana sayfaya gitmek için
              },
              icon: Icon(
                Icons.arrow_back,
                color: isDarkMode ? Colors.white : Colors.black, // İkon rengi
              ),
              label: Text(
                "Geri Dön",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black, // Yazı rengi
                ),
              ),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: isDarkMode
                    ? const Color.fromARGB(
                        221, 42, 52, 61) // Gece modunda kutu rengi
                    : const Color.fromARGB(
                        255, 255, 255, 255), // Gündüz modunda beyaz kutu
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
