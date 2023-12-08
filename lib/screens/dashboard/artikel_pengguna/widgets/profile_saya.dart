import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:boemil_mobile/screens/dashboard/artikel_pengguna/widgets/profile_pengguna.dart';

class ProfileSaya extends StatefulWidget {
  @override
  _ProfileSayaState createState() => _ProfileSayaState();
}

class _ProfileSayaState extends State<ProfileSaya> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    nameController.text = "Aminah";
    ageController.text = "25";
    emailController.text = "aminah@example.com";
    passwordController.text = "password123";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
        backgroundColor: Color(0xFFFAE8E9),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFFAE8E9),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 812,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : AssetImage('assets/images/ibuhamil.png')
                                  as ImageProvider<Object>,
                        ),
                        InkWell(
                          onTap: () {
                            _tambahGambar();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFD71AE),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Aminah",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    buildTextField('Nama', nameController,
                        labelText: 'Nama', isBold: true),
                    SizedBox(height: 10),
                    buildTextField('Usia', ageController,
                        labelText: 'Usia', isBold: true),
                    SizedBox(height: 10),
                    buildTextField('Email', emailController,
                        labelText: 'Email', isBold: true),
                    SizedBox(height: 10),
                    buildTextField('Kata Sandi', passwordController,
                        obscureText: true,
                        labelText: 'Kata Sandi',
                        isBold: true),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _simpanData,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFD71AE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Sofia Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool obscureText = false, String? labelText, bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
        decoration: InputDecoration(
          labelText: labelText ?? label,
          isDense: true,
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }

  Future<void> _tambahGambar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _simpanData() {
    String name = nameController.text;
    String age = ageController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // Validasi data sebelum menyimpan
    if (name.isEmpty || age.isEmpty || email.isEmpty || password.isEmpty) {
      // Tampilkan pesan kesalahan dengan warna latar belakang merah
      _showSnackBar("Semua field harus diisi", backgroundColor: Colors.red);
      return;
    }

    // Lakukan sesuatu dengan data tersebut
    // Simpan data ke penyimpanan atau lakukan tindakan lainnya

    // Tampilkan pesan sukses dengan warna latar belakang hijau
    _showSnackBar("Berhasil memperbarui profil", backgroundColor: Colors.green);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ProfilePengguna();
        },
      ),
    );
  }

  void _showSnackBar(String message, {Color backgroundColor = Colors.green}) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
