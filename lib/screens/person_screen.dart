import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5FB), // Soft pastel arka plan
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C6E97), // Pastel mavi
        title: const Text(
          'Profilim',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Kişisel Bilgiler Başlığı
            Text(
              'Kişisel Bilgiler',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 20),

            // Kullanıcı Bilgileri
            _buildInfoCard(
              title: 'Kullanıcı Adı',
              value: 'elif_gezi',
            ),
            _buildInfoCard(
              title: 'Doğum Tarihi',
              value: '12 Ocak 1995',
            ),
            _buildInfoCard(
              title: 'Cinsiyet',
              value: 'Kadın',
            ),
            _buildInfoCard(
              title: 'Yaş',
              value: '29',
            ),

            const SizedBox(height: 30),

            // Blog Paylaşımları Başlığı
            Text(
              'Gezdiği Yerler ve Paylaşımlar',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 15),

            // Paylaşımlar (Özet)
            _buildPostSummary(
              location: 'Kapadokya, Türkiye',
              summary:
                  'Kapadokya\'da balon turuna çıktım ve manzara inanılmazdı! Güneşin doğuşu ile gökyüzüne yükselmek çok etkileyiciydi.',
            ),
            _buildPostSummary(
              location: 'Bali, Endonezya',
              summary:
                  'Bali’de tropikal plajların tadını çıkardım. Sahil boyunca yürüyüş yaparak denizle iç içe bir gün geçirdim.',
            ),
            _buildPostSummary(
              location: 'Roma, İtalya',
              summary:
                  'Roma’nın tarihi dokusuna hayran kaldım. Colosseum ve Pantheon arasında bir gün geçirdim ve tarihle iç içe oldum.',
            ),
            _buildPostSummary(
              location: 'Kyoto, Japonya',
              summary:
                  'Kyoto’da geleneksel tapınakları ziyaret ettim ve Japon bahçelerinin huzur verici atmosferinde kaybolarak rahatladım.',
            ),
            _buildPostSummary(
              location: 'New York, ABD',
              summary:
                  'New York’ta Central Park’ta yürüyüş yaparak şehrin dinamizmini hissettim. Ayrıca Empire State Building’ten manzarayı izlemek harikaydı!',
            ),
          ],
        ),
      ),
    );
  }

  // Kullanıcı bilgilerini göstermek için kart widget'ı
  Widget _buildInfoCard({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              '$title: ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Blog paylaşımlarının özetini göstermek için kart widget'ı
  Widget _buildPostSummary(
      {required String location, required String summary}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4C6E97), // Pastel mavi
              ),
            ),
            const SizedBox(height: 8),
            Text(
              summary,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
