import 'package:flutter/material.dart';
import '../widgets/bottom_menu.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gezgin Paylaşımları'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildUserPost(
            userName: "Zeynep",
            userImage: "assets/images/profile1.jpg", // Profil Resmi
            postImage: "assets/images/machu_picchu.jpg", // Paylaşım Resmi
            postText:
                "Machu Picchu'ya gitmek, hayatımda yaptığım en unutulmaz yolculuklardan biriydi. Peru'nun yüksek dağlarında, antik Inka medeniyetinin izlerini görmek bana gerçekten çok şey öğretti...",
          ),
          _buildUserPost(
            userName: "Gökhan",
            userImage: "assets/images/profile2.jpg", // Profil Resmi
            postImage: "assets/images/banff_canada.jpg", // Paylaşım Resmi
            postText:
                "Kanada'nın Banff Milli Parkı, doğa severler için bir cennet. Sadece görsel güzellikleriyle değil, aynı zamanda sunduğu macera olanaklarıyla da dikkat çekiyor...",
          ),
        ],
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }

  Widget _buildUserPost({
    required String userName,
    required String userImage,
    required String postImage,
    required String postText,
  }) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kullanıcı Bilgisi
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(userImage), // Kullanıcı profili
                ),
                const SizedBox(width: 8),
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Siyah renk
                  ),
                ),
              ],
            ),
          ),
          // Paylaşım Görseli
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              postImage, // Paylaşılan yerin resmi
              fit: BoxFit.cover,
            ),
          ),
          // Yazı
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              postText,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
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
              'Aktivite Seçin',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: Text('Doğa Yürüyüşleri'),
                  selected: true,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('Tarihi Yerler'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('Dağcılık'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('Plajlar'),
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
                hintText: 'Yer veya Aktivite Ara...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Fiyat Aralığı',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Min',
                      prefixText: '₺',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Max',
                      prefixText: '₺',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
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
