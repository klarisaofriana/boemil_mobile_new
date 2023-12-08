import 'package:flutter/material.dart';
import 'artikel_detail_page.dart';
import 'item_artikel/artikel_1.dart';
import 'item_artikel/artikel_2.dart';
import 'item_artikel/artikel_3.dart';
import 'item_artikel/artikel_4.dart';
import 'item_artikel/artikel_5.dart';
import 'item_artikel/artikel_6.dart';
import 'widgets/frame777.dart';
import 'widgets/artikel_item.dart';
import 'widgets/isi.dart';

// Buat class untuk merepresentasikan setiap artikel
class Artikel {
  final String title;
  final String imageUrl;
  final String content;
  final Widget widget;

  Artikel({
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.widget,
  });
}

class ArtikelPage extends StatelessWidget {
  // Ganti daftar artikelTitles dan artikelImages dengan daftar Artikel
  final List<Artikel> artikelList = [
    Artikel(
      title: 'Senam Hamil: Tips dan manfaat untuk kehamilan yang sehat',
      imageUrl: 'assets/images/latihankehamilan.png',
      content:
          'Kehamilan adalah salah satu momen yang penuh kegembiraan dan harapan.',
      widget: Artikel1(),
    ),
    Artikel(
      title: 'Tidak mengalami kenaikan berat badan yang cukup saat hamil',
      imageUrl: 'assets/images/beratbadanibuhamil.png',
      content:
          'Salah satu aspek penting dalam kehamilan adalah kenaikan berat badan',
      widget: Artikel2(),
    ),
    Artikel(
      title: 'Kecukupan nutrisi ibu hamil selama bulan puasa',
      imageUrl: 'assets/images/polamakansehatibuhamil.png',
      content:
          'Masa bulan puasa seringkali dianggap sebagai momen refleksi spiritual',
      widget: Artikel3(),
    ),
    Artikel(
      title: 'Cara menjaga kesehatan ibu hamil dan janin dalam kandungan',
      imageUrl: 'assets/images/periksakehamilan.png',
      content:
          'Merawat kesehatan selama kehamilan adalah langkah penting untuk memas',
      widget: Artikel4(),
    ),
    Artikel(
      title: 'Susu yang bagus untuk ibu hamil, cek rekomendasinya disini!',
      imageUrl: 'assets/images/susuuntukibuhamil.png',
      content:
          'Susu merupakan sumber nutrisi penting bagi ibu hamil karena mengandung',
      widget: Artikel5(),
    ),
    Artikel(
      title:
          'Ciri-ciri preeklamsia pada ibu hamil: Bumil hindari 5 gangguan ini!',
      imageUrl: 'assets/images/preeklamsiapadaibuhamil.png',
      content: 'Preeklamsia adalah suatu kondisi yang dapat',
      widget: Artikel6(),
    ),
  ];

  void _navigateToDetailPage(BuildContext context, Artikel artikel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArtikelDetailPage(
          artikelWidget: artikel.widget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Frame777(),
              Isi(
                onItemClick: (item) {
                  print('Item clicked: $item');
                  // Handling item click for non-article items
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: artikelList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _navigateToDetailPage(context, artikelList[index]);
                    },
                    child: ArtikelItem(
                      imageUrl: artikelList[index].imageUrl,
                      title: artikelList[index].title,
                      content: artikelList[index].content,
                      onTap: () {
                        _navigateToDetailPage(context, artikelList[index]);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
