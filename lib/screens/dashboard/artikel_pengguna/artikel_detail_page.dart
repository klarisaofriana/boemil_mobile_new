import 'package:flutter/material.dart';

class ArtikelDetailPage extends StatelessWidget {
  final Widget artikelWidget;

  ArtikelDetailPage({required this.artikelWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ArtikelWidget akan dimuat di sini
            artikelWidget,
          ],
        ),
      ),
    );
  }
}
