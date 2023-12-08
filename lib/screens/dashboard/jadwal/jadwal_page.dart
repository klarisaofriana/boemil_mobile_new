import 'package:flutter/material.dart';
import 'tambah_jadwal_page.dart';
import 'custom_jadwal_card.dart';
import 'edit_kalender.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Tambahkan baris ini

class JadwalPage extends StatefulWidget {
  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  DateTime _selectedDate = DateTime.now();
  final List<String> _bulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];
  final List<String> _hari = ['Min', 'Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab'];

  List<Map<String, String>> jadwalList = [];

  Future<void> _updateJadwalList(List<Map<String, String>> newList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'jadwalList',
      newList.map((e) => json.encode(e)).toList(),
    );
  }

  void _getJadwalList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonStringList = prefs.getStringList('jadwalList');
    if (jsonStringList != null) {
      List<Map<String, String>> loadedList = jsonStringList
          .map((e) => Map<String, String>.from(json.decode(e)))
          .toList();
      setState(() {
        jadwalList = loadedList;
      });
    }
  }

  void _nextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
    });
  }

  void _prevMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
    });
  }

  Widget _buildMonthCalendar() {
    int daysInMonth =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    int startWeekday =
        DateTime(_selectedDate.year, _selectedDate.month, 1).weekday;

    List<Widget> calendarBoxes = [];

    for (String day in _hari) {
      calendarBoxes.add(_buildDayNameBox(day));
    }

    for (int i = 1; i < startWeekday; i++) {
      calendarBoxes.add(_buildEmptyBox());
    }

    List<String> monthDays =
        List.generate(daysInMonth, (index) => (index + 1).toString());

    int remainingEmptyBoxes = (7 - startWeekday) % 7;

    for (int i = 0; i < remainingEmptyBoxes; i++) {
      calendarBoxes.add(_buildEmptyBox());
    }

    for (int i = 0; i < monthDays.length; i++) {
      calendarBoxes.add(_buildDayBox(monthDays[i]));
    }

    List<Widget> calendarRows = [];
    int rowLength = 7;

    for (int i = 0; i < calendarBoxes.length; i += rowLength) {
      List<Widget> rowChildren = calendarBoxes.sublist(
        i,
        i + rowLength <= calendarBoxes.length
            ? i + rowLength
            : calendarBoxes.length,
      );

      calendarRows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowChildren,
        ),
      );
    }

    return Container(
      color: Color(0xFFFEEDF5),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          for (var row in calendarRows) row,
        ],
      ),
    );
  }

  Widget _buildDayNameBox(String day) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: Text(
        day,
        style: TextStyle(
          color: Color(0xFF0F2F5B),
          fontSize: 12,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildEmptyBox() {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: Text(''),
    );
  }

  Widget _buildDayBox(String day) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: Text(
        day,
        style: TextStyle(
          color: Color(0xFF8E381E),
        ),
      ),
    );
  }

  Widget _buildJadwalList() {
    List<Widget> customJadwalCards = [];

    for (int index = 0; index < jadwalList.length; index++) {
      customJadwalCards.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomJadwalCard(
            tanggal: jadwalList[index]['tanggal']!,
            judul: jadwalList[index]['judul']!,
            onDelete: () {
              _removeList(index);
            },
          ),
        ),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: customJadwalCards,
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Positioned(
      bottom: 16.0,
      right: 16.0,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahJadwalPage()),
          ).then((value) {
            if (value != null) {
              Map<String, String> newJadwal = value;
              List<Map<String, String>> updatedList = List.from(jadwalList)
                ..add(newJadwal);
              _updateJadwalList(updatedList);
              setState(() {
                jadwalList = updatedList;
              });
            }
          });
        },
        child: EditKalender(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getJadwalList();
  }

  void _removeList(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Yakin ingin menghapus jadwal ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                List<Map<String, String>> updatedList = List.from(jadwalList)
                  ..removeAt(index);
                _updateJadwalList(updatedList);
                setState(() {
                  jadwalList = updatedList;
                });
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: _prevMonth,
                  ),
                  Text(
                    '${_bulan[_selectedDate.month - 1]} - ${_selectedDate.year}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0F2F5B),
                      fontSize: 16,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: _nextMonth,
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildMonthCalendar(),
              SizedBox(height: 10),
              _buildJadwalList(),
            ],
          ),
          _buildAddButton(),
        ],
      ),
    );
  }
}
