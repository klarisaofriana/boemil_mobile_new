import 'package:flutter/material.dart';
import 'artikel_page.dart';
import 'package:boemil_mobile/screens/dashboard/jadwal/jadwal_page.dart';
import 'package:boemil_mobile/screens/dashboard/ukuran_janin/ukuran_janin_page.dart';
import 'package:boemil_mobile/screens/dashboard/berat_badan/berat_saya_page.dart';
import 'package:boemil_mobile/screens/dashboard/artikel_pengguna/widgets/tombol_menu1.dart';
import 'package:boemil_mobile/screens/dashboard/artikel_pengguna/widgets/profile_pengguna.dart';

class ArtikelBumilUtama extends StatefulWidget {
  @override
  _ArtikelBumilUtamaState createState() => _ArtikelBumilUtamaState();
}

class _ArtikelBumilUtamaState extends State<ArtikelBumilUtama> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _getPage(_selectedIndex),
      bottomNavigationBar: TombolMenu(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        _getAppBarTitle(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      backgroundColor: Color(0xFFF5F5F5),
      automaticallyImplyLeading: false,
      actions: [
        if (_selectedIndex == 0)
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePengguna()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/ibuhamil.png'),
              ),
            ),
          ),
      ],
    );
  }

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Artikel';
      case 1:
        return 'Jadwal Periksa';
      case 2:
        return 'Ukuran Janin';
      case 3:
        return 'Berat Saya';
      default:
        return 'Artikel';
    }
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return ArtikelPage();
      case 1:
        return JadwalPage();
      case 2:
        return UkuranJaninPage();
      case 3:
        return BeratSayaPage();
      default:
        return ArtikelPage();
    }
  }
}
