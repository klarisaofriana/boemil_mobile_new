import 'package:flutter/material.dart';

class Artikel5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Artikel5
        Image.asset(
          'assets/images/susuuntukibuhamil.png',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 16),
        Text(
          'Susu yang bagus untuk ibu hamil, cek rekomendasinya disini!',
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
              'Susu merupakan sumber nutrisi penting bagi ibu hamil karena mengandung sejumlah zat gizi yang dibutuhkan untuk pertumbuhan janin. Pemilihan jenis susu yang tepat dapat memberikan manfaat baik bagi kesehatan ibu hamil dan perkembangan janin.'
              '\n\nBerikut adalah beberapa jenis susu yang bagus untuk ibu hamil:'
              '\n\n1. **Susu Hamil**: Susu khusus untuk ibu hamil biasanya mengandung nutrisi tambahan seperti asam folat, zat besi, kalsium, dan DHA yang mendukung perkembangan janin.'
              '\n\n2. **Susu Skim**: Bagi ibu hamil yang ingin mengontrol asupan lemak, susu skim bisa menjadi pilihan. Tetapi pastikan untuk mendapatkan kalsium tambahan dari sumber lain.'
              '\n\n3. **Susu Kedelai**: Susu kedelai cocok untuk ibu hamil yang memiliki intoleransi laktosa atau memilih gaya hidup vegetarian. Kandungan protein nabati dan isoflavon dalam kedelai dapat memberikan manfaat.'
              '\n\n4. **Susu Almond**: Susu almond mengandung nutrisi penting seperti vitamin E dan magnesium. Meskipun rendah kalori, pastikan untuk memperoleh nutrisi tambahan dari sumber lain.'
              '\n\n5. **Susu Greek Yogurt**: Yogurt Yunani kaya akan protein dan probiotik, baik untuk kesehatan pencernaan ibu hamil.'
              '\n\nSebelum mengubah pola makan, selalu konsultasikan dengan dokter atau ahli gizi untuk memastikan pilihan susu yang sesuai dengan kebutuhan kesehatan ibu hamil. Semoga ibu hamil dapat menikmati kehamilan dengan sehat dan bahagia!',
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
