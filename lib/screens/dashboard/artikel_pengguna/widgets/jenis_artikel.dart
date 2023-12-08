/* import 'package:flutter/material.dart';
import 'widgets/isi.dart';
import 'widgets/frame777.dart';
import 'widgets/artikel_item.dart';
import 'artikel_detail_page.dart';
import 'package:boemil_mobile/screens/dashboard/artikel_pengguna/artikel_bumil_utama.dart';

class ArtikelPage extends StatelessWidget {
  final String jenisArtikel;

  ArtikelPage({required this.jenisArtikel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Frame777(), // Perbaikan #1: Hapus baris ini jika Frame777 bukan widget
              Isi(
                onItemClick: (item) {
                  print('Item clicked: $item');
                  _navigateToDetailPage(context, '', '', '');
                },
                jenisArtikel: jenisArtikel,
              ),
              ArtikelItem(
                imageUrl: 'assets/images/latihankehamilan.png',
                title:
                    'Senam Hamil: Tips dan manfaat untuk kehamilan yang sehat',
                content: 'Isi artikel 1',
                jenisArtikel: jenisArtikel,
                onTap: () {
                  _navigateToDetailPage(
                    context,
                    'assets/images/latihankehamilan.png',
                    'Senam Hamil: Tips dan manfaat untuk kehamilan yang sehat',
                    'Isi artikel 1',
                  );
                },
              ),
              SizedBox(height: 4),
              ArtikelItem(
                imageUrl: 'assets/images/ibuhamil.png',
                title: 'Judul Artikel 2',
                content: 'Isi artikel 2',
                jenisArtikel: jenisArtikel,
                onTap: () {
                  _navigateToDetailPage(
                    context,
                    'assets/images/ibuhamil.png',
                    'Judul Artikel 2',
                    'Isi artikel 2',
                  );
                },
              ),
              SizedBox(height: 4),
              ArtikelItem(
                imageUrl: 'assets/images/ibuhamil.png',
                title: 'Judul Artikel 3',
                content: 'Isi artikel 3',
                jenisArtikel: jenisArtikel,
                onTap: () {
                  _navigateToDetailPage(
                    context,
                    'assets/images/ibuhamil.png',
                    'Judul Artikel 3',
                    'Isi artikel 3',
                  );
                },
              ),
              SizedBox(height: 4),
              ArtikelItem(
                imageUrl: 'assets/images/ibuhamil.png',
                title: 'Judul Artikel 4',
                content: 'Isi artikel 4',
                jenisArtikel: jenisArtikel,
                onTap: () {
                  _navigateToDetailPage(
                    context,
                    'assets/images/ibuhamil.png',
                    'Judul Artikel 4',
                    'Isi artikel 4',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetailPage(
      BuildContext context, String imageUrl, String title, String content) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArtikelDetailPage(
          imageUrl: imageUrl,
          title: title,
          content: content,
        ),
      ),
    );
  }
}
 */