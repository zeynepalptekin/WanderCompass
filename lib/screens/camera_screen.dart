import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/bottom_menu.dart';

class CameraScreen extends StatelessWidget {
  CameraScreen({super.key});

  final List<Map<String, String>> cards = [
    {
      'userName': 'Zeynep',
      'userImage': 'assets/images/profile1.jpg', // Profil Resmi
      'postImage': 'assets/images/machu_picchu.jpg', // Paylaşım Resmi
      'description':
          "Machu Picchu'ya gitmek, hayatımda yaptığım en unutulmaz yolculuklardan biriydi. Peru'nun yüksek dağlarında, antik Inka medeniyetinin izlerini görmek bana gerçekten çok şey öğretti...",
    },
    {
      'userName': 'Gökhan',
      'userImage': 'assets/images/profile2.jpg', // Profil Resmi
      'postImage': 'assets/images/banff_canada.jpg', // Paylaşım Resmi
      'description':
          "Kanada'nın Banff Milli Parkı, doğa severler için bir cennet. Sadece görsel güzellikleriyle değil, aynı zamanda sunduğu macera olanaklarıyla da dikkat çekiyor...",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gezgin Paylaşımları'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final card = cards[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kullanıcı Bilgisi
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    card['userImage']!), // Profil fotoğrafı
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  card['userName']!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Paylaşım Görseli
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(
                            card['postImage']!, // Paylaşım fotoğrafı
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Yazı
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            card['description']!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),

                        // İkonlar
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(CupertinoIcons.heart),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(CupertinoIcons.bubble_left),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(CupertinoIcons.share),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(CupertinoIcons.bookmark),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: cards.length,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
