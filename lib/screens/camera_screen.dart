import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/bottom_menu.dart';
import '../core/themes.dart';

class CameraScreen extends StatelessWidget {
  CameraScreen({super.key});

  final List<Map<String, String>> cards = [
    {
      'userName': 'Zeynep',
      'userImage': 'assets/images/profile1.jpg',
      'postImage': 'assets/images/machu_picchu.jpg',
      'description':
          "Machu Picchu'ya gitmek, hayatımda yaptığım en unutulmaz yolculuklardan biriydi. Peru'nun yüksek dağlarında, antik Inka medeniyetinin izlerini görmek bana gerçekten çok şey öğretti...",
    },
    {
      'userName': 'Gökhan',
      'userImage': 'assets/images/profile2.jpg',
      'postImage': 'assets/images/banff_canada.jpg',
      'description':
          "Kanada'nın Banff Milli Parkı, doğa severler için bir cennet. Sadece görsel güzellikleriyle değil, aynı zamanda sunduğu macera olanaklarıyla da dikkat çekiyor...",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gezgin Paylaşımları',
          style: theme.appBarTheme.titleTextStyle,
        ),
        backgroundColor: theme.primaryColor,
        elevation: 0,
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
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(card['userImage']!),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  card['userName']!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: theme.textTheme.bodyLarge?.color ??
                                        Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(
                            card['postImage']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            card['description']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.textTheme.bodyMedium?.color ??
                                  Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(CupertinoIcons.heart,
                                    color: theme.iconTheme.color),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(CupertinoIcons.bubble_left,
                                    color: theme.iconTheme.color),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(CupertinoIcons.share,
                                    color: theme.iconTheme.color),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(CupertinoIcons.bookmark,
                                    color: theme.iconTheme.color),
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
