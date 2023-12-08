/* import 'package:flutter/material.dart';

class ArtikelBumilUtama extends StatefulWidget {
  const ArtikelBumilUtama({Key? key}) : super(key: key);

  @override
  _ArtikelBumilUtamaState createState() => _ArtikelBumilUtamaState();
}

class _ArtikelBumilUtamaState extends State<ArtikelBumilUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama Artikel'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Pemanggilan navigasi ke halaman ArtikelHalaman
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArtikelHalaman()),
                );
              },
              child: Text('Buka Halaman Artikel'),
            ),
          ),
        ],
      ),
    );
  }
}

class ArtikelHalaman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Artikel'),
      ),
      body: Center(
        child: Text('Ini adalah halaman artikel.'),
      ),
    );
  }
}
 */