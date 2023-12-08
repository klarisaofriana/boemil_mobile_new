import 'package:flutter/material.dart';
import 'buah_ukuran_page.dart';
import 'hewan_ukuran_page.dart';

class UkuranJaninPage extends StatefulWidget {
  @override
  _UkuranJaninPageState createState() => _UkuranJaninPageState();
}

class _UkuranJaninPageState extends State<UkuranJaninPage> {
  String selectedOption = 'Berdasarkan Buah';
  bool isDropdownVisible = false;
  String ukuranText = 'Ukuran';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                decoration: ShapeDecoration(
                  color: Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.60,
                      color: Color(0x7F010101),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    ukuranText,
                    textAlign: TextAlign.center, // Pusatkan teks
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w400,
                      height: 0.05,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      setState(() {
                        isDropdownVisible = !isDropdownVisible;
                      });
                    },
                  ),
                ),
              ),
              if (isDropdownVisible) _buildDropdownOverlay(context),
              SizedBox(height: 10),
              selectedOption == 'Berdasarkan Buah'
                  ? BuahUkuranPage()
                  : HewanUkuranPage(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownOverlay(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 120,
      decoration: ShapeDecoration(
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.60,
            color: Color(0x7F010101),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          _buildListTile('Berdasarkan Buah'),
          _buildListTile('Berdasarkan Hewan'),
        ],
      ),
    );
  }

  Widget _buildListTile(String option) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
          isDropdownVisible = false;
          ukuranText = 'Ukuran Janin $option';
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        color: selectedOption == option ? Colors.grey[300] : null,
        child: Text(
          'Ukuran Janin $option',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UkuranJaninPage(),
  ));
}
