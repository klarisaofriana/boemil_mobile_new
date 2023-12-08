import 'package:flutter/material.dart';
import 'ukuran_card.dart';

class HewanUkuranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UkuranCard(
          bulan: 'Bulan 1',
          bijiChia: 'Beruang Air',
          panjang: 'Panjang: 1,5 mm (kepala sampai bokong)',
          berat: 'Berat: -',
          imageUrl: 'assets/images/hewan_bulan1.png',
          isBuahOption: false,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 2',
          bijiChia: 'Kepompong Ulat Sutra',
          panjang: 'Panjang: 1,6 cm (kepala sampai bokong)',
          berat: 'Berat: -',
          imageUrl: 'assets/images/hewan_bulan2.png',
          isBuahOption: false,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 3',
          bijiChia: 'Anak Ayam',
          panjang: 'Panjang: 5,4 cm (kepala sampai bokong)',
          berat: 'Berat: 58 g',
          imageUrl: 'assets/images/hewan_bulan3.png',
          isBuahOption: false,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 4',
          bijiChia: 'Burung Kolibri',
          panjang: 'Panjang: 14,7 cm (kepala sampai bokong)',
          berat: 'Berat: 93 g',
          imageUrl: 'assets/images/hewan_bulan4.png',
          isBuahOption: false,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 5',
          bijiChia: 'Burung Sikatan Hitam',
          panjang: 'Panjang: 18,6 cm (kepala sampai tumit)',
          berat: 'Berat: 146 g',
          imageUrl: 'assets/images/hewan_bulan5.png',
          isBuahOption: false,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 6',
          bijiChia: 'Burung Puffin',
          panjang: 'Panjang: 29-32,5 cm (kepala sampai tumit)',
          berat: 'Berat: 475-670 g',
          imageUrl: 'assets/images/hewan_bulan6.png',
          isBuahOption: false,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 7',
          bijiChia: 'Burung Hantu',
          panjang: 'Panjang: 33-38 cm (kepala sampai tumit)',
          berat: 'Berat: 785-1250 g',
          imageUrl: 'assets/images/hewan_bulan7.png',
          isBuahOption: false,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 8',
          bijiChia: 'Penguin Kecil',
          panjang: 'Panjang: 39-43 cm (kepala sampai tumit)',
          berat: 'Berat: 1,35-2 kg',
          imageUrl: 'assets/images/hewan_bulan8.png',
          isBuahOption: false,
        ),
        SizedBox(height: 10),
        UkuranCard(
          bulan: 'Bulan 9',
          bijiChia: 'Lemur',
          panjang: 'Panjang: 48-51 cm (kepala sampai tumit)',
          berat: 'Berat: 3-3,65 kg',
          imageUrl: 'assets/images/hewan_bulan9.png',
          isBuahOption: false,
        ),
        // Tambahkan card lain jika diperlukan untuk bulan 10 dst.
      ],
    );
  }
}
