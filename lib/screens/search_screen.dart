import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final List<Map<String, String>> cards = [
    {
      'title': 'İstanbul',
      'description': 'Tarihin ve kültürün başkenti.',
      'imagePath': 'assets/images/istanbul.jpg',
    },
    {
      'title': 'Paris',
      'description': 'Sanatın ve romantizmin şehri.',
      'imagePath': 'assets/images/paris.jpg',
    },
    {
      'title': 'Tokyo',
      'description': 'Teknolojinin ve geleneklerin birleşimi.',
      'imagePath': 'assets/images/tokyo.jpg',
    },
    {
      'title': 'New York',
      'description': 'Dünyanın kalbi, ışıklar şehri.',
      'imagePath': 'assets/images/newyork.jpg',
    },
    {
      'title': 'Barcelona',
      'description': 'Mimari harikalar ve Akdeniz esintileri.',
      'imagePath': 'assets/images/barcelona.jpg',
    },
    {
      'title': 'Londra',
      'description': 'Kraliyet tarihi ve modern kültürün birleşimi.',
      'imagePath': 'assets/images/london.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: TextField(
              decoration: InputDecoration(
                hintText: "Seyahat Rotası Arama",
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceVariant,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: () => _showFilterDialog(context),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Son Keşifler",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      ActionChip(
                        label: Text("İstanbul"),
                        onPressed: () {},
                        avatar: Icon(Icons.history, size: 16),
                      ),
                      ActionChip(
                        label: Text("Paris"),
                        onPressed: () {},
                        avatar: Icon(Icons.history, size: 16),
                      ),
                      ActionChip(
                        label: Text("Tokyo"),
                        onPressed: () {},
                        avatar: Icon(Icons.history, size: 16),
                      ),
                      ActionChip(
                        label: Text("Barcelona"),
                        onPressed: () {},
                        avatar: Icon(Icons.history, size: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final card = cards[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(
                            card['imagePath']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                card['title']!,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                card['description']!,
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Filtrele'),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategoriler',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: Text('İstanbul'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('Paris'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('Tokyo'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('New York'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('Barcelona'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('Londra'),
                  selected: false,
                  onSelected: (_) {},
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Arama',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Şehir ara...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Temizle'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Uygula'),
          ),
        ],
      ),
    );
  }
}
