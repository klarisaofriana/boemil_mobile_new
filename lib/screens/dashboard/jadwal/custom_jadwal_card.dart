import 'package:flutter/material.dart';

class CustomJadwalCard extends StatelessWidget {
  final String tanggal;
  final String judul;
  final VoidCallback onDelete;

  CustomJadwalCard({
    required this.tanggal,
    required this.judul,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Container(
        width: double.infinity,
        height: 70,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              child: Stack(
                children: [
                  Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 12,
                          offset: Offset(0, 0),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 7,
                      height: 70,
                      decoration: BoxDecoration(color: Color(0xFFFF3AB0)),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10,
              top: 8,
              child: Text(
                tanggal,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5400000214576721),
                  fontSize: 15,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w700,
                  height: 0.05,
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 32,
              child: Text(
                judul,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w700,
                  height: 0.05,
                ),
              ),
            ),
            Positioned(
              left: 325,
              top: 22,
              child: GestureDetector(
                onTap: onDelete,
                child: Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF858585),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Hapus',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Sofia Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
