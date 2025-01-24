import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF80CBC4),
        title: const Text(
          "Paylaşımlar",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildUserPost(
              context,
              userName: "Zeynep",
              userImage: "assets/images/profile1.jpg", // Profil resmi
              postImage:
                  "assets/images/machu_picchu.jpg", // Paylaşılan yer resmi
              postText:
                  "Machu Picchu'ya gitmek, hayatımda yaptığım en unutulmaz yolculuklardan biriydi. Peru'nun yüksek dağlarında, antik Inka medeniyetinin izlerini görmek bana gerçekten çok şey öğretti. Yürüyüşler yapmak, bölgenin doğal güzelliklerine tanık olmak harika bir deneyimdi. Eğer bu bölgeye gitmeyi düşünüyorsanız, erken saatlerde yola çıkmanızı öneririm çünkü kalabalıklar henüz gelmeden, sakin bir şekilde bu muazzam yapıları keşfetmek çok daha keyifli oluyor. Ayrıca, sıcak hava koşullarına karşı hazırlıklı olmanızı tavsiye ederim, çünkü yükseklik nedeniyle hava bazen beklenmedik şekilde değişebiliyor. Bu harika yerin büyüsünü keşfetmek için bir gün mutlaka tekrar gelmeyi planlıyorum.",
            ),
            const SizedBox(height: 16),
            _buildUserPost(
              context,
              userName: "Gökhan",
              userImage: "assets/images/profile2.jpg", // Profil resmi
              postImage:
                  "assets/images/banff_canada.jpg", // Paylaşılan yer resmi
              postText:
                  "Kanada'nın Banff Milli Parkı, doğa severler için bir cennet. Sadece görsel güzellikleriyle değil, aynı zamanda sunduğu macera olanaklarıyla da dikkat çekiyor. Banff'te yürüyüş yaparken, göllerin ve dağların mükemmel uyumunu izlemek insanı büyülüyor. Eğer burada doğa yürüyüşleri yapmayı planlıyorsanız, başlangıç seviyesinden ileri düzeye kadar pek çok parkur mevcut. Özellikle yaz aylarında yürüyüş yapmak için ideal, ancak kışın da kayak yapma fırsatı sunan parkurları ile burası dört mevsim keşfedilebilecek bir yer. Kışın gidecekseniz, kayak malzemelerinizi ve sıcak giysilerinizi unutmamalısınız! Banff'te geçirdiğim her anı unutamam, doğal güzellikleriyle kendimi doğanın bir parçası gibi hissettim. Tekrar gelmek için sabırsızlanıyorum!",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserPost(
    BuildContext context, {
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
}
