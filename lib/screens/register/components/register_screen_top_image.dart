import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class RegisterScreenTopImage extends StatelessWidget {
  const RegisterScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Daftar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ).merge(
            TextStyle(
              color: Color(0xFFFF7CAB),
            ),
          ),
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Column(
                children: [],
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
