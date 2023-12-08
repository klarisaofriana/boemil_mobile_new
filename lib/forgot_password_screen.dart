import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _emailErrorText = '';
  bool _emailSent = false;

  void _validateAndSend(BuildContext context) async {
    String email = _emailController.text;

    if (email.isEmpty) {
      setState(() {
        _emailErrorText = 'Email tidak boleh kosong';
        _emailSent = false;
      });
    } else {
      bool emailSent = await _sendEmail(email);

      if (emailSent) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email telah terkirim ke $email'),
            duration: Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Tutup',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
            backgroundColor: Colors.green,
          ),
        );

        _emailController.clear();
        setState(() {
          _emailErrorText = '';
        });
      } else {
        setState(() {
          _emailErrorText = 'Gagal mengirim email. Silakan coba lagi.';
          _emailSent = false;
        });
      }
    }
  }

  void _onOkButtonPressed() {
    Navigator.pop(context);
  }

  Future<bool> _sendEmail(String email) async {
    bool isValid = _validateEmail(email);
    return isValid;
  }

  bool _validateEmail(String email) {
    bool isValid = EmailValidator.validate(email);
    return isValid;
  }

  void _onBackButtonPressed(BuildContext context) {
    // Implement back button action here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 150, horizontal: 20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Tulisan(),
            SizedBox(height: 50),
            EmailInput(
              emailController: _emailController,
              emailErrorText: _emailErrorText,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _onBackButtonPressed(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Kembali',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SendButton(
                      emailController: _emailController,
                      emailErrorText: _emailErrorText,
                      onOkButtonPressed: _onOkButtonPressed,
                      validateAndSend: _validateAndSend,
                      emailSent: _emailSent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  final TextEditingController emailController;
  final String emailErrorText;
  final VoidCallback onOkButtonPressed;
  final Function(BuildContext) validateAndSend;
  final bool emailSent;

  SendButton({
    required this.emailController,
    required this.emailErrorText,
    required this.onOkButtonPressed,
    required this.validateAndSend,
    required this.emailSent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Color(0xFFFD71AE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () {
          validateAndSend(context);
        },
        child: Text(
          'Kirim',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class Tulisan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 237,
      height: 87,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 74,
            child: Text(
              'Lihat pesan masuk ke Email anda',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0E0C0C),
                fontSize: 15.5,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.normal,
                height: 0.04,
              ),
            ),
          ),
          Positioned(
            left: 26,
            top: 10,
            child: Text(
              'Lupa Kata Sandi ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFC78A7),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0.03,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;
  final String emailErrorText;

  EmailInput({
    required this.emailController,
    required this.emailErrorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyle(
              color: Color(0xFF1E293B),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.11,
              letterSpacing: 0.12,
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: Color(0xFFEDF3F8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 250,
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5),
                          errorText:
                              emailErrorText.isNotEmpty ? emailErrorText : null,
                          filled: true,
                          fillColor: Color(0xFFEDF3F8),
                          hintText: 'email@gmail.com',
                          hintStyle: TextStyle(
                            color: Color(0xFF7B8794),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        autofocus: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
