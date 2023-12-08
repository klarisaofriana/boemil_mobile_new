import 'package:flutter/material.dart';

class Artikel4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Artikel4
        Image.asset(
          'assets/images/periksakehamilan.png',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 16),
        Text(
          'Cara menjaga kesehatan ibu hamil dan janin dalam kandungan',
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
              'Merawat kesehatan selama kehamilan adalah langkah penting untuk memastikan kesejahteraan ibu hamil dan perkembangan janin dengan baik. Berikut adalah beberapa cara menjaga kesehatan ibu hamil dan janin dalam kandungan:'
              '\n\n1. **Pemeriksaan Prenatal Teratur**: Rutin melakukan pemeriksaan prenatal dengan dokter kandungan sangat penting. Pemeriksaan ini membantu memantau perkembangan janin, mendeteksi potensi masalah kesehatan, dan memberikan perawatan yang dibutuhkan.'
              '\n\n2. **Konsumsi Makanan Bergizi**: Pastikan asupan makanan mencakup nutrisi yang cukup, seperti protein, zat besi, kalsium, asam folat, dan vitamin. Makanan seimbang membantu perkembangan otak janin dan menjaga kesehatan ibu.'
              '\n\n3. **Hindari Zat Berbahaya**: Hindari konsumsi alkohol, merokok, dan obat-obatan yang tidak aman selama kehamilan. Zat-zat tersebut dapat berdampak buruk pada perkembangan janin.'
              '\n\n4. **Istirahat Cukup**: Pastikan ibu hamil mendapatkan istirahat yang cukup. Istirahat yang baik membantu mengurangi kelelahan dan mendukung pertumbuhan janin.'
              '\n\n5. **Senam Hamil yang Aman**: Lakukan senam hamil yang disetujui oleh dokter. Senam ringan dapat membantu menjaga kebugaran dan kesehatan ibu hamil.'
              '\n\n6. **Pantau Kesehatan Mental**: Hormon dan perubahan fisik selama kehamilan dapat memengaruhi kesehatan mental. Dukungan sosial dan berbicara dengan profesional kesehatan mental dapat membantu mengatasi stres atau kecemasan.'
              '\n\n7. **Konsultasi dengan Dokter**: Jika ada kekhawatiran atau gejala yang muncul, segera konsultasikan dengan dokter. Konsultasi teratur membantu mendeteksi dan mengatasi potensi masalah kesehatan.'
              '\n\nIngatlah bahwa menjaga kesehatan selama kehamilan adalah investasi dalam kesejahteraan ibu dan janin. Dengan perawatan yang baik, semoga perjalanan kehamilan Anda berlangsung dengan lancar dan sehat!',
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
