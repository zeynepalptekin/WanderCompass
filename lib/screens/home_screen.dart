import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../widgets/bottom_menu.dart';
import '../widgets/suggested_action_card.dart';
import '../core/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WanderCompass',
            style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.moon),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  CupertinoIcons.person_circle,
                  size: 80,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              accountName: Text("Hoşgeldiniz"),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text('Ana Sayfa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.search),
              title: Text('Arama'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.photo),
              title: Text('Fotoğraflar'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.book),
              title: Text('Blok Yazıları'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.bookmark),
              title: Text('Kaydedilenler'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.airplane),
              title: Text('Seyahatlerim'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.location),
              title: Text('Konum'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail),
              title: Text('İletişim'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings),
              title: Text('Ayarlar'),
              onTap: () => context.go("/settings"),
            ),
            Spacer(),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Çıkış Yap'),
              onTap: () => context.go("/login"),
            ),
          ],
        ),
      ),

      // Ana içerik
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(24),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: DotLottieLoader.fromAsset(
                    "assets/motions/q.lottie",
                    frameBuilder: (context, dotlottie) {
                      if (dotlottie != null) {
                        return Lottie.memory(
                          dotlottie.animations.values.single,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: ListView(
                  padding: EdgeInsets.all(24),
                  children: [
                    SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: Icons.search,
                      title: "Aramalar",
                      subtitle: "Seyahat aramaları yapın",
                      onTap: () => context.push("/search"),
                    ),
                    SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: Icons.photo_camera,
                      title: "Gezgin Paylaşımları",
                      subtitle: "Sosyal medya paylaşımlarına gözatın",
                      onTap: () => context.push("/camera"),
                    ),
                    SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: Icons.map,
                      title: "Seyahat Rotası Önerileri",
                      subtitle: "Yeni rotalar keşfedin",
                      onTap: () => context.push("/map"),
                    ),
                    SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: Icons.person,
                      title: "Kişisel Bilgiler",
                      subtitle: "Kişisel bilgilerinizi düzenleyin",
                      onTap: () => context.push("/person"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomMenu(),
    );
  }
}
