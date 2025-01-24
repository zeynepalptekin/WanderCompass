import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Kişisel blog yazıları ve sosyal medya hesapları için örnek veriler
    final List<Map<String, String>> bloggers = [
      {
        "name": "Elif Yılmaz",
        "location": "Kapadokya, Türkiye",
        "bio":
            "Seyahat etmek, hayattaki en büyük tutkum. Dünyayı keşfetmek, farklı kültürler ve insanlarla tanışmak bana hayatın ne kadar değerli olduğunu hatırlatıyor. Kapadokya'dan Bali'ye kadar her yer farklı bir macera.",
        "blog":
            "Bugün Kapadokya'da balon turuna çıktım ve muazzam bir deneyim yaşadım. Güneşin doğuşuyla birlikte gökyüzüne yükselmek, dünyadaki en harika şeylerden biri. Her anı fotoğrafladım, ama fotoğraflarda bile o anı tam olarak yansıtmak mümkün değil.",
        "social": "@elif_yilmaz_gezi"
      },
      {
        "name": "James Anderson",
        "location": "Roma, İtalya",
        "bio":
            "Bir fotoğrafçı, gezgin ve hikaye anlatıcısıyım. Her bir yolculuk, bana yeni bir perspektif kazandırıyor. Roma'da geçirdiğim her gün, tarihin derinliklerine inmek gibi.",
        "blog":
            "Roma'da geçirdiğim zaman gerçekten unutulmazdı. Colosseum'u gezdikten sonra Antik Roma'nın büyüklüğünü ve etkisini daha iyi anladım. Bu şehirde her sokakta bir başka hikaye var ve her hikaye beni daha çok büyüledi.",
        "social": "@james_anderson_travel"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 178, 148, 214),
        elevation: 0,
        title: const Text(
          "Medya Paylaşımları",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: 1.2, // Harf aralıkları modern bir görünüm için
            fontFamily: 'Montserrat', // Estetik yazı tipi
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: bloggers.length,
          itemBuilder: (context, index) {
            final blogger = bloggers[index];
            return _buildBloggerCard(
              name: blogger["name"]!,
              location: blogger["location"]!,
              bio: blogger["bio"]!,
              blogPost: blogger["blog"]!,
              socialMedia: blogger["social"]!,
            );
          },
        ),
      ),
    );
  }

  // Kişisel blog kartı tasarımı
  Widget _buildBloggerCard({
    required String name,
    required String location,
    required String bio,
    required String blogPost,
    required String socialMedia,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18), // Daha yumuşak köşeler
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 8), // Gölgeyi daha belirgin yap
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kişisel Bilgiler ve Konum
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 1.1, // Harf aralığı ekledik
                      fontFamily: 'Roboto', // Estetik yazı tipi
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic, // Daha zarif bir görünüm
                      fontFamily: 'Roboto', // Estetik yazı tipi
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey, height: 1),

            // Kısa Biyografi
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                bio,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  height: 1.8, // Satır aralığı
                  fontWeight: FontWeight.w500, // Daha hafif font
                  fontFamily: 'Roboto', // Estetik yazı tipi
                ),
              ),
            ),
            const Divider(color: Colors.grey, height: 1),

            // Blog Yazısı
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                blogPost,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  height: 1.8, // Satır aralığı
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto', // Estetik yazı tipi
                ),
              ),
            ),
            const Divider(color: Colors.grey, height: 1),

            // Sosyal Medya Bilgisi ve İkon
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Row(
                children: [
                  // Sosyal Medya İkonu
                  Icon(
                    Icons.camera, // Instagram ikonu
                    color: const Color.fromARGB(
                        255, 107, 172, 225), // Soft mavi tonunda
                    size: 22,
                  ),
                  const SizedBox(width: 10),
                  // Sosyal Medya Kullanıcı Adı
                  Text(
                    socialMedia,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(
                          255, 123, 46, 210), // Pastel mor renk
                      fontFamily: 'Roboto', // Estetik yazı tipi
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
