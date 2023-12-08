import 'package:flutter/material.dart';

class Artikel1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Artikel1
        Image.asset(
          'assets/images/latihankehamilan.png',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 16),
        Text(
          'Senam Hamil: Tips dan manfaat untuk kehamilan yang sehat',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flexible(
            child: Text(
              'Kehamilan adalah salah satu momen yang penuh kegembiraan dan harapan. Untuk menjaga kesehatan ibu dan janin, senam hamil menjadi kegiatan yang sangat dianjurkan. Senam hamil dapat memberikan berbagai manfaat, mulai dari meningkatkan stamina hingga memperkuat otot-otot yang dibutuhkan selama persalinan.'
              '\n\nBerikut adalah beberapa tips dan manfaat senam hamil:'
              '\n\n1. **Konsultasikan dengan Dokter**: Sebelum memulai senam hamil, selalu konsultasikan terlebih dahulu dengan dokter kandungan. Dokter akan memberikan saran yang sesuai dengan kondisi kesehatan ibu dan janin.'
              '\n\n2. **Pilih Senam yang Aman**: Pilih jenis senam yang aman untuk ibu hamil. Senam aerobik ringan, senam prenatal, dan yoga hamil adalah pilihan yang baik.'
              '\n\n3. **Jaga Postur Tubuh**: Selama senam, pastikan untuk menjaga postur tubuh yang baik. Hindari gerakan yang terlalu ekstrem atau membebani bagian tubuh tertentu.'
              '\n\n4. **Rutin Berolahraga**: Lakukan senam hamil secara rutin. Hal ini dapat membantu meningkatkan stamina, mengurangi ketidaknyamanan selama kehamilan, dan mempersiapkan tubuh untuk persalinan.'
              '\n\n5. **Perhatikan Perubahan Tubuh**: Selama kehamilan, tubuh mengalami banyak perubahan. Perhatikan tanda-tanda seperti nyeri atau ketidaknyamanan, dan hentikan senam jika diperlukan.'
              '\n\nSenam hamil bukan hanya bermanfaat secara fisik, tetapi juga dapat membantu mengurangi stres dan meningkatkan suasana hati. Dengan melakukan senam hamil secara teratur, ibu hamil dapat memastikan bahwa dirinya dan bayinya tetap sehat hingga waktu persalinan.'
              '\n\nIngatlah untuk selalu mendengarkan tubuh dan tidak memaksakan diri. Jika terdapat kondisi kesehatan tertentu, diskusikan dengan dokter sebelum memulai program senam hamil. Semoga kehamilan Anda berjalan dengan lancar dan sehat!',
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
