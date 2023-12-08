import 'package:flutter/material.dart';

class Artikel6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Artikel6
        Image.asset(
          'assets/images/preeklamsiapadaibuhamil.png',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 16),
        Text(
          'Ciri-ciri preeklamsia pada ibu hamil: Bumil hindari 5 gangguan ini!',
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
              'Preeklamsia adalah suatu kondisi yang dapat terjadi pada ibu hamil dan biasanya muncul setelah usia kehamilan 20 minggu. Kondisi ini ditandai oleh tekanan darah tinggi dan adanya kerusakan pada organ-organ tubuh, seperti hati dan ginjal.'
              '\n\nBerikut adalah beberapa ciri-ciri preeklamsia yang perlu diwaspadai:'
              '\n\n1. **Tekanan Darah Tinggi**: Peningkatan tekanan darah adalah tanda utama preeklamsia. Monitoring tekanan darah secara teratur selama kehamilan sangat penting.'
              '\n\n2. **Proteinuria**: Adanya protein dalam urine juga merupakan indikasi preeklamsia. Pemeriksaan urine rutin dapat mendeteksi adanya protein.'
              '\n\n3. **Pembengkakan**: Pembengkakan tangan, kaki, atau wajah dapat menjadi tanda preeklamsia. Perhatikan perubahan pada tubuh dan segera konsultasikan ke dokter.'
              '\n\n4. **Gangguan Penglihatan**: Masalah penglihatan, seperti penglihatan kabur atau munculnya kilat cahaya, dapat terjadi pada preeklamsia.'
              '\n\n5. **Nyeri Abdomen atau Area Hati**: Nyeri yang persisten pada bagian perut atau area hati juga perlu diwaspadai sebagai gejala preeklamsia.'
              '\n\nBila Anda mengalami salah satu atau beberapa gejala tersebut, segera hubungi dokter. Preeklamsia dapat berkembang dengan cepat, dan penanganan dini sangat penting untuk menjaga kesehatan ibu dan janin.'
              '\n\nSelain itu, hindari faktor risiko preeklamsia dengan menjalani pemeriksaan kehamilan secara teratur dan mengikuti saran dokter. Semoga informasi ini bermanfaat untuk kesehatan ibu hamil. Tetap jaga kehamilan dengan baik!',
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
