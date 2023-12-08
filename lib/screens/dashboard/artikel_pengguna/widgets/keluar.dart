import 'package:flutter/material.dart';
import 'package:boemil_mobile/Screens/Welcome/welcome_screen.dart';

class UserKeluar extends StatelessWidget {
  final double containerWidth = 259;
  final double containerHeight = 149;

  final TextStyle textStyle = TextStyle(
    color: Colors.black.withOpacity(0.32),
    fontSize: 14.55,
    fontFamily: 'Mulish',
    fontWeight: FontWeight.w600,
    height: 0.10,
    letterSpacing: 0.12,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      child: Stack(
        children: [
          _positionedText(41, 41, 'Ingin Keluar?', 182, 43, textStyle, () {
            // Tambahkan logika untuk tombol "Ingin Keluar?" di sini
          }),
          _positionedText(31, 109, 'Batal', 83, 40, textStyle, () {
            Navigator.of(context)
                .pop(); // Tutup dialog ketika tombol "Batal" diklik
          }),
          _positionedText(169, 107, 'Ya', 54, 40, textStyle, () {
            // Pindah ke halaman ArtikelBumilUtama ketika tombol "Ya" diklik
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WelcomeScreen(),
              ),
            );
          }),
        ],
      ),
    );
  }

  Positioned _positionedText(double left, double top, String text, double width,
      double height, TextStyle style, Function() onPressed) {
    return Positioned(
      left: left,
      top: top,
      child: SizedBox(
        width: width,
        height: height,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
      ),
    );
  }
}
