import 'package:flutter/material.dart';
import 'ukuran_card.dart';

class BuahUkuranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UkuranCard(
          bulan: 'Bulan 1',
          bijiChia: 'Biji Chia',
          panjang: 'Panjang: 1,5 mm (kepala sampai bokong)',
          berat: 'Berat: -',
          imageUrl: 'assets/images/buah_bulan1.png',
          isBuahOption: true,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 2',
          bijiChia: 'Buah Rasberi',
          panjang: 'Panjang: 1,6 cm (kepala sampai bokong)',
          berat: 'Berat: 4 g',
          imageUrl: 'assets/images/buah_bulan2.png',
          isBuahOption: true,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 3',
          bijiChia: 'Buah Prem',
          panjang: 'Panjang: 5,4 cm (kepala sampai bokong)',
          berat: 'Berat: 58 g',
          imageUrl: 'assets/images/buah_bulan3.png',
          isBuahOption: true,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 4',
          bijiChia: 'Buah Alpukat',
          panjang: 'Panjang: 14,7 cm (kepala sampai bokong)',
          berat: 'Berat: 93 g',
          imageUrl: 'assets/images/buah_bulan4.png',
          isBuahOption: true,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 5',
          bijiChia: 'Buah Pisang',
          panjang: 'Panjang: 18,6 cm (kepala sampai tumit)',
          berat: 'Berat: 146 g',
          imageUrl: 'assets/images/buah_bulan5.png',
          isBuahOption: true,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 6',
          bijiChia: 'Buah Nangka',
          panjang: 'Panjang: 29-32,5 cm (kepala sampai tumit)',
          berat: 'Berat: 475-670 g',
          imageUrl: 'assets/images/buah_bulan6.png',
          isBuahOption: true,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 7',
          bijiChia: 'Buah Pepaya',
          panjang: 'Panjang: 33-38 cm (kepala sampai tumit)',
          berat: 'Berat: 785-1250 g',
          imageUrl: 'assets/images/buah_bulan7.png',
          isBuahOption: true,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 8',
          bijiChia: 'Buah Labu Musim Dingin',
          panjang: 'Panjang: 39-43 cm (kepala sampai tumit)',
          berat: 'Berat: 1,35-2 kg',
          imageUrl: 'assets/images/buah_bulan8.png',
          isBuahOption: true,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 9',
          bijiChia: 'Buah Semangka',
          panjang: 'Panjang: 48-51 cm (kepala sampai tumit)',
          berat: 'Berat: 3-3,65 kg',
          imageUrl: 'assets/images/buah_bulan9.png',
          isBuahOption: true,
        ),
        // Tambahkan card lain jika diperlukan untuk bulan 10 dst.
      ],
    );
  }
}
