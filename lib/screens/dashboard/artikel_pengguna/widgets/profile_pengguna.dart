import 'package:flutter/material.dart';
import 'profile_saya.dart';
import 'keluar.dart';

class ProfilePengguna extends StatelessWidget {
  const ProfilePengguna({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Color(0xFFFAE8E9),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, '/artikel_bumil_utama');
                },
                child: Text(
                  'Tutup',
                  style: TextStyle(
                    color: Color(0xFF292186),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 1.0,
            child: Container(
              color: Color(0xFFFAE8E9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  _buildProfileAvatar(context),
                  const SizedBox(height: 20),
                  Text(
                    "Aminah",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _buildMenuButton(context, 'Profil saya', ProfileSaya()),
                  const SizedBox(height: 10),
                  _buildMenuButton(context, 'Keluar', UserKeluar()),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    return InkWell(
      onTap: () {
        _showFullScreenImage(context);
      },
      child: Hero(
        tag: 'user_avatar',
        child: CircleAvatar(
          radius: 75,
          backgroundImage: AssetImage('assets/images/ibuhamil.png'),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      BuildContext context, String text, Widget destinationPage) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.55,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.12,
            ),
          ),
          onTap: () {
            if (text == 'Keluar') {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    content: destinationPage,
                  );
                },
              );
            } else if (text == 'Profil saya') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => destinationPage,
                ),
              );
            }
          },
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.black,
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Color(0xFFDDDDDD),
        ),
      ],
    );
  }

  void _showFullScreenImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Hero(
              tag: 'user_avatar',
              child: Image(
                image: AssetImage('assets/images/ibuhamil.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
