import 'package:flutter/material.dart';

class Artikel2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Artikel2
        Image.asset(
          'assets/images/beratbadanibuhamil.png',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 16),
        Text(
          'Tidak mengalami kenaikan berat badan yang cukup saat hamil',
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
              'Salah satu aspek penting dalam kehamilan adalah kenaikan berat badan yang sehat. Meskipun setiap wanita hamil mengalami kenaikan berat badan, namun terdapat kondisi di mana beberapa ibu hamil mungkin tidak mengalami peningkatan berat badan yang cukup.'
              '\n\nKenaikan berat badan yang tidak mencukupi selama kehamilan dapat berisiko dan memengaruhi kesehatan ibu hamil dan janin. Berikut adalah beberapa alasan mengapa kenaikan berat badan yang cukup saat hamil sangat penting:'
              '\n\n1. **Pertumbuhan Janin**: Kenaikan berat badan yang sehat memberikan nutrisi yang cukup untuk pertumbuhan janin. Ini membantu memastikan bahwa janin mendapatkan semua nutrien yang dibutuhkannya untuk berkembang dengan baik.'
              '\n\n2. **Kesehatan Ibu Hamil**: Kenaikan berat badan yang cukup juga penting untuk menjaga kesehatan ibu hamil. Ini membantu mencegah masalah kesehatan seperti anemia dan ketidakseimbangan nutrisi.'
              '\n\n3. **Persiapan untuk Menyusui**: Kenaikan berat badan yang cukup dapat mempersiapkan tubuh ibu hamil untuk menyusui. Menyusui membutuhkan energi tambahan, dan kenaikan berat badan yang cukup dapat membantu menyimpan cadangan energi.'
              '\n\nJika Anda mengalami kesulitan dalam mencapai kenaikan berat badan yang cukup, konsultasikan dengan dokter atau ahli gizi. Mereka dapat memberikan saran yang sesuai dengan kebutuhan spesifik Anda dan memberikan rekomendasi untuk menjaga kesehatan ibu hamil dan janin.'
              '\n\nIngatlah untuk selalu mendengarkan saran dokter dan menjalani pemeriksaan prenatal secara teratur. Semoga kehamilan Anda berjalan dengan baik dan sehat!',
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
