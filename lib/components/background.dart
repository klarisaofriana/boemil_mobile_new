import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Hapus bagian ini jika ingin menghapus gambar atas

            // Hapus bagian ini jika ingin menghapus gambar bawah

            Center(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
