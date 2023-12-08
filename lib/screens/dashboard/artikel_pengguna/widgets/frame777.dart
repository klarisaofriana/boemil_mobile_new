import 'package:flutter/material.dart';

class Frame777 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16), // Tambahkan jarak dengan SizedBox
        buildTextContainer('Selamat Datang\n', 17, FontWeight.w500, 400, 33),
        buildTextContainer('\n\nBoemil!', 22, FontWeight.w800, 400, 33),
      ],
    );
  }

  Widget buildTextContainer(String text, double fontSize, FontWeight fontWeight,
      double width, double height) {
    return Container(
      padding: EdgeInsets.only(bottom: 16), // Tambahkan padding ke bawah
      width: width,
      height: height,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontFamily: 'Gothic A1',
          fontWeight: fontWeight,
          height: (1.0 / fontSize),
        ),
      ),
    );
  }
}
