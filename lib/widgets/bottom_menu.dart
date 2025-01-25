import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary, // Tema ile uyumlu renk
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Ana Sayfa İkonu
          IconButton(
            onPressed: () {
              context.go("/home"); // Ana sayfaya yönlendirme
            },
            icon: Icon(
              CupertinoIcons.home,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimary, // Tema ile uyumlu renk
            ),
          ),
          // Arama İkonu
          IconButton(
            onPressed: () {
              context.go("/search"); // Arama sayfasına yönlendirme
            },
            icon: Icon(
              CupertinoIcons.search,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          // Kamera İkonu
          IconButton(
            onPressed: () {
              context.go("/camera"); // Kamera sayfasına yönlendirme
            },
            icon: Icon(
              CupertinoIcons.camera,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          // Harita İkonu
          IconButton(
            onPressed: () {
              context.go("/map"); // Harita sayfasına yönlendirme
            },
            icon: Icon(
              CupertinoIcons.map,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          // Profil İkonu
          IconButton(
            onPressed: () {
              context.go("/person"); // Profil sayfasına yönlendirme
            },
            icon: Icon(
              CupertinoIcons.person,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
