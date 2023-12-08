import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../forgot_password_screen.dart';
import '../../register/register_screen.dart';
import '../../dashboard/artikel_pengguna/artikel_bumil_utama.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          buildEmailTextField(),
          SizedBox(height: 20),
          buildPasswordTextField(),
          SizedBox(height: 20),
          buildForgotPasswordLink(),
          SizedBox(height: 40),
          buildLoginButton(),
          const SizedBox(height: 20),
          buildAlreadyHaveAccountCheck(),
        ],
      ),
    );
  }

  Widget buildEmailTextField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Color(0xFFFD71AE)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFD71AE)),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  Widget buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      textInputAction: TextInputAction.done,
      obscureText: true,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        labelText: "Kata Sandi",
        labelStyle: TextStyle(color: Color(0xFFFD71AE)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFD71AE)),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  Widget buildForgotPasswordLink() {
    return Container(
      width: 360,
      height: 21,
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ForgotPasswordScreen();
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Lupa kata sandi?',
              style: TextStyle(
                color: Color(0xFF5890FF),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0.11,
                letterSpacing: 0.12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (validateInputs(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          )) {
            try {
              UserCredential userCredential =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
              );

              // fetch the user from Firestore using the uid
              DocumentSnapshot userSnapshot = await FirebaseFirestore
                  .instance
                  .collection('users')
                  .doc(userCredential.user!.uid)
                  .get();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtikelBumilUtama(),
                ),
              );
            } catch (error) {
              print('Error during login: $error');
              // Handle specific error messages based on the type of error.
              // For example, you can display different SnackBars for different errors.
            }
          }
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFEC407A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          minimumSize: const Size(129, 48),
        ),
        child: const Text(
          'Masuk',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildAlreadyHaveAccountCheck() {
    return AlreadyHaveAnAccountCheck(
      press: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RegisterScreen();
            },
          ),
        );
      },
    );
  }

  bool validateInputs(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Masukkan email dan kata sandi'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }
}
