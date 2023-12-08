import 'package:flutter/material.dart';
import 'package:boemil_mobile/constants.dart';
import 'package:boemil_mobile/responsive.dart';
import '../../components/background.dart';
import 'components/register_screen_top_image.dart';
import 'components/register_form.dart';
import 'components/socal_register.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileRegisterScreen(),
          desktop: Row(
            children: [
              Expanded(
                child: RegisterScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: RegisterForm(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    // SocalSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileRegisterScreen extends StatelessWidget {
  MobileRegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RegisterScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: RegisterForm(),
            ),
            Spacer(),
          ],
        ),
        // const SocalRegister()
      ],
    );
  }
}
