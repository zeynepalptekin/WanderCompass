import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 102, 134),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo ve yükleme göstergesi bölümü
          Container(
            width: double.infinity,
            child: Column(
              children: [
                // Logo bölümü
                Container(
                  width: 450,
                  height: 180,
                  child: Image.asset(
                    'assets/images/logo.webp',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 20),

                // Yükleniyor yazısı
                const Text(
                  'Yükleniyor...',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),

                InkWell(
                    onTap: () => context.go("/home"),
                    child: SizedBox(
                      width: 200,
                      child: DotLottieLoader.fromAsset(
                          "assets/motions/loading.lottie", frameBuilder:
                              (BuildContext ctx, DotLottie? dotlottie) {
                        if (dotlottie != null) {
                          return Lottie.memory(
                              dotlottie.animations.values.single);
                        } else {
                          return Container();
                        }
                      }),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
