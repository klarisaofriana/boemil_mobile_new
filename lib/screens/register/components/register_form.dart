import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../model/user_model.dart';
import '../../login/login_screen.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final double buttonWidth = double.infinity;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _kataSandiController = TextEditingController();
  final TextEditingController _konfirmasiKataSandiController =
      TextEditingController();

  String? _namaError;
  String? _emailError;
  String? _kataSandiError;
  String? _konfirmasiKataSandiError;

  bool _kataSandiObscure = true;
  bool _konfirmasiKataSandiObscure = true;

  String validateName(String value) {
    if (value.isEmpty) {
      return 'Masukkan Nama';
    }
    return '';
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Masukkan Email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Masukkan Email yang valid';
    }
    return '';
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Masukkan Kata Sandi';
    } else if (value.length < 6) {
      return 'Kata Sandi minimal 6 karakter';
    } else if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]+$')
        .hasMatch(value)) {
      return 'Kata Sandi harus kombinasi:\n'
          'huruf besar, huruf kecil, angka, dan karakter khusus';
    }
    return '';
  }

  String validateConfirmPassword(String value, String password) {
    if (value.isEmpty) {
      return 'Konfirmasi Kata Sandi tidak boleh kosong';
    } else if (value != password) {
      return 'Konfirmasi Kata Sandi tidak sesuai';
    }
    return '';
  }

  String validateForm() {
    setState(() {
      _namaError = validateName(_namaController.text);
      _emailError = validateEmail(_emailController.text);
      _kataSandiError = validatePassword(_kataSandiController.text);
      _konfirmasiKataSandiError = validateConfirmPassword(
        _konfirmasiKataSandiController.text,
        _kataSandiController.text,
      );
    });

    // Validasi tambahan atau logika lainnya bisa ditambahkan di sini

    // Periksa apakah ada pesan kesalahan, jika tidak kembalikan pesan berhasil
    if (_namaError == null &&
        _emailError == null &&
        _kataSandiError == null &&
        _konfirmasiKataSandiError == null) {
      return 'Berhasil Daftar';
    } else {
      return 'Gagal Daftar';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _namaController,
            decoration: InputDecoration(
              labelText: 'Nama',
              labelStyle: TextStyle(color: Color(0xFFFD71AE)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFD71AE)),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorText: _namaError,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Color(0xFFFD71AE)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFD71AE)),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorText: _emailError,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _kataSandiController,
            obscureText: _kataSandiObscure,
            decoration: InputDecoration(
              labelText: 'Kata Sandi',
              labelStyle: TextStyle(color: Color(0xFFFD71AE)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFD71AE)),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorText: _kataSandiError,
              suffixIcon: IconButton(
                icon: Icon(_kataSandiObscure
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _kataSandiObscure = !_kataSandiObscure;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _konfirmasiKataSandiController,
            obscureText: _konfirmasiKataSandiObscure,
            decoration: InputDecoration(
              labelText: 'Konfirmasi Kata Sandi',
              labelStyle: TextStyle(color: Color(0xFFFD71AE)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFD71AE)),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorText: _konfirmasiKataSandiError,
              suffixIcon: IconButton(
                icon: Icon(_konfirmasiKataSandiObscure
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _konfirmasiKataSandiObscure = !_konfirmasiKataSandiObscure;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
                      onPressed: () async {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _kataSandiController.text.trim());

                          // Create a new user model
                          UserModel user = UserModel(
                              uid: userCredential.user!.uid,
                              name: _namaController.text.trim(),
                              email: _emailController.text.trim(),
                            );

                          // Store user data in Firestore
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user.uid)
                              .set(user.toMap());

                          // Navigate to sign in screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        } catch (e) {
                          print(e);
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
                        'Daftar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
          ),
          if (_namaError != null ||
              _emailError != null ||
              _kataSandiError != null ||
              _konfirmasiKataSandiError != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Gagal Daftar. Harap periksa kembali data Anda.',
                style: TextStyle(color: Colors.red),
              ),
            ),
          const SizedBox(height: 20),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
