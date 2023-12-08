import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'BOEMIL',
          style: GoogleFonts.dongle(
            fontWeight: FontWeight.bold,
            fontSize: 80,
          ).merge(
            TextStyle(
              color: Color(0xFFFF7CAB),
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  SizedBox(
                      height: defaultPadding), // Penambahan jarak antara gambar
                  Image.asset(
                    "assets/images/welcome_boemil.png",
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
