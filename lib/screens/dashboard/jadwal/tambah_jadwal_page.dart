import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'jadwal_page.dart';

class TambahJadwalPage extends StatefulWidget {
  @override
  _TambahJadwalPageState createState() => _TambahJadwalPageState();
}

class _TambahJadwalPageState extends State<TambahJadwalPage> {
  TextEditingController _keteranganController = TextEditingController();
  DateTime? _selectedDate = DateTime.now(); // Inisialisasi dengan nilai default

  Future<void> _updateJadwalList(List<Map<String, String>> newList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'jadwalList',
      newList.map((e) => json.encode(e)).toList(),
    );
  }

  void _saveJadwal() async {
    if (_selectedDate != null && _keteranganController.text.isNotEmpty) {
      Map<String, String> newJadwal = {
        'tanggal':
            "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}",
        'judul': _keteranganController.text,
      };

      List<Map<String, String>> updatedList = List.from(jadwalList)
        ..add(newJadwal);

      await _updateJadwalList(updatedList);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tambah jadwal berhasil'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pop(context, newJadwal);
    } else {
      _showErrorMessage(
          'Silahkan isi tanggal dan keterangan jadwal terlebih dahulu');
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Widget buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildDatePickerInput() {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: _selectedDate != null
                ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                : 'DD/MM/YYYY',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMultilineTextInput() {
    return TextField(
      controller: _keteranganController,
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Masukkan keterangan jadwal',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildSaveButton() {
    return ElevatedButton(
      onPressed: _saveJadwal,
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFFD71AE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text('Simpan', style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Jadwal Periksa'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText('Tanggal  :'),
            SizedBox(height: 10),
            buildDatePickerInput(),
            SizedBox(height: 16),
            buildText('Keterangan :'),
            SizedBox(height: 10),
            buildMultilineTextInput(),
            SizedBox(height: 24),
            buildSaveButton(),
          ],
        ),
      ),
    );
  }
}

// Tambahkan baris berikut ke akhir file untuk menyertakan variabel dan fungsi yang diperlukan.
List<Map<String, String>> jadwalList = [];
