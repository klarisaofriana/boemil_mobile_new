import 'package:flutter/material.dart';

class Artikel3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Artikel3
        Image.asset(
          'assets/images/polamakansehatibuhamil.png',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 16),
        Text(
          'Kecukupan nutrisi ibu hamil selama bulan puasa',
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
              'Masa bulan puasa seringkali dianggap sebagai momen refleksi spiritual dan praktik berbagai kegiatan ibadah. Bagi ibu hamil yang menjalankan puasa, menjaga kesehatan dan nutrisi yang cukup sangat penting untuk memastikan kesehatan ibu dan janin.'
              '\n\nBerikut adalah beberapa tips untuk memastikan kecukupan nutrisi ibu hamil selama bulan puasa:'
              '\n\n1. **Sahur Seimbang**: Pastikan sahur Anda mencakup makanan yang seimbang, termasuk sumber karbohidrat kompleks, protein, lemak sehat, serat, dan vitamin.'
              '\n\n2. **Konsumsi Air yang Cukup**: Penting untuk tetap terhidrasi selama puasa. Pastikan Anda minum air dalam jumlah yang cukup antara waktu berbuka dan sahur.'
              '\n\n3. **Pilih Makanan Bergizi**: Pilih makanan yang kaya akan nutrisi, seperti buah-buahan, sayuran, dan sumber protein sehat seperti daging tanpa lemak dan kacang-kacangan.'
              '\n\n4. **Hindari Makanan Berlemak dan BerGula Tinggi**: Batasi konsumsi makanan yang tinggi lemak jenuh dan gula, karena dapat menyebabkan peningkatan berat badan yang tidak sehat.'
              '\n\n5. **Konsultasikan dengan Dokter**: Jika Anda hamil dan berniat untuk menjalankan puasa, penting untuk berkonsultasi dengan dokter atau ahli gizi. Mereka dapat memberikan saran yang sesuai dengan kebutuhan kesehatan spesifik Anda.'
              '\n\nIngatlah bahwa kesehatan ibu hamil dan janin selalu menjadi prioritas utama. Jika ada kondisi tertentu atau kekhawatiran kesehatan, segera konsultasikan dengan tenaga medis. Semoga puasa Anda berjalan lancar dan memberikan manfaat bagi kesehatan Anda dan bayi Anda.',
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
