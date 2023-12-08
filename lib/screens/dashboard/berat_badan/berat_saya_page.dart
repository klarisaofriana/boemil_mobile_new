import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderItem extends StatelessWidget {
  final String text;

  HeaderItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          if (text != null && text.isNotEmpty)
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Crimson Pro',
                fontWeight: FontWeight.w700,
              ),
            ),
          if (text == null || text.isEmpty)
            Text(
              '-',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Crimson Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }
}

class DataItem extends StatelessWidget {
  final String text;

  DataItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Crimson Pro',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class BeratSayaPage extends StatefulWidget {
  @override
  _BeratSayaPageState createState() => _BeratSayaPageState();
}

class _BeratSayaPageState extends State<BeratSayaPage> {
  String selectedMonth = '- Pilih bulan -';
  TextEditingController beratBadanController = TextEditingController();
  TextEditingController beratAwalController = TextEditingController();
  List<String> recordedData = [];
  String pencatatanTitle = 'Pencatatan';
  String bulanLabel = 'Bulan';
  String beratAwalLabel = 'Berat Badan Awal';
  String beratBadanLabel = 'Berat Badan Saat Ini';

  @override
  void initState() {
    super.initState();
    _clearInvalidData();
    _loadRecordedData();
  }

  void _clearInvalidData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedData = prefs.getStringList('recordedData');

    if (storedData != null) {
      List<String> validData = [];

      for (String data in storedData) {
        List<String> parts = data.split(', ');

        if (parts.length >= 4) {
          validData.add(data);
        }
      }

      prefs.setStringList('recordedData', validData);
    }
  }

  _loadRecordedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      recordedData = prefs.getStringList('recordedData') ?? [];
    });
  }

  _saveRecordedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('recordedData', recordedData);
  }

  Widget _buildInputContainer(String judul, String isian,
      [TextEditingController? controller]) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(judul),
        SizedBox(height: 10),
        if (judul.toLowerCase() != 'bulan') _buildTextField(isian, controller),
        if (judul.toLowerCase() == 'bulan') _buildMonthDropdown(),
      ],
    );
  }

  Widget _buildMonthDropdown() {
    List<String> months = [
      '- Pilih bulan -',
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

    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 0.60, color: Colors.black.withOpacity(0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedMonth,
            icon: Icon(Icons.arrow_drop_down),
            onChanged: (String? newValue) =>
                setState(() => selectedMonth = newValue ?? ''),
            items: months
                .map<DropdownMenuItem<String>>((String value) =>
                    DropdownMenuItem<String>(value: value, child: Text(value)))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String isian, [TextEditingController? controller]) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 0.60, color: Colors.black.withOpacity(0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: isian,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 16,
              fontFamily: 'Karla',
              fontWeight: FontWeight.w400,
              height: 0.05,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Karla',
            fontWeight: FontWeight.w500,
            height: 0.04,
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return GestureDetector(
      onTap: () {
        String selectedMonth = this.selectedMonth;
        String beratAwal = beratAwalController.text;
        String beratBadan = beratBadanController.text;
        _saveCatatan(selectedMonth, beratAwal, beratBadan);
      },
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Color(0xFFFD71AE),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
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
    );
  }

  Widget _buildPencatatanStatus() {
    bool isDataAvailable = recordedData.isNotEmpty;

    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              'Pencatatan',
              style: TextStyle(
                color: Color(0xFF222121),
                fontSize: 18,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w700,
                height: 0.11,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            if (isDataAvailable) _buildDataHeaders(),
            if (isDataAvailable)
              for (int i = 0; i < recordedData.length; i++)
                _buildFormattedCatatan(recordedData[i], i),
            if (!isDataAvailable)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HeaderItem('Bulan'),
                  HeaderItem('BBA'),
                  HeaderItem('BBSI'),
                  HeaderItem('Status'),
                  HeaderItem('Hapus'),
                ],
              ),
            if (!isDataAvailable)
              Text(
                '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Crimson Pro',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataHeaders() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HeaderItem('Bulan'),
        HeaderItem('BBA'),
        HeaderItem('BBSI'),
        HeaderItem('Status'),
        HeaderItem('Hapus'),
      ],
    );
  }

  Widget _buildFormattedCatatan(String catatan, int index) {
    List<String> parts = catatan.split(', ');

    if (parts.length >= 4) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DataItem(parts[0]),
          DataItem(parts[1]),
          DataItem(parts[2]),
          DataItem(parts[3]),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _konfirmasiHapusCatatan(context, index);
            },
          ),
        ],
      );
    } else {
      return Container(
        child: Text('Invalid data format in catatan at index $index'),
      );
    }
  }

  void _konfirmasiHapusCatatan(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah Anda yakin ingin menghapus catatan ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                _hapusCatatan(index);
                Navigator.pop(context);
              },
              child: Text("Hapus"),
            ),
          ],
        );
      },
    );
  }

  void _hapusCatatan(int index) {
    setState(() {
      recordedData.removeAt(index);
    });
    _saveRecordedData();
  }

  void _saveCatatan(String selectedMonth, String beratAwal, String beratBadan) {
    double? beratAwalValue = double.tryParse(beratAwal);
    double? beratBadanValue = double.tryParse(beratBadan);

    if (beratAwalValue == null ||
        beratBadanValue == null ||
        beratBadanValue < 0 ||
        beratAwalValue < 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(
                "Masukkan berat badan harus berupa angka dan tidak boleh kurang dari 0."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }

    String status = _tentukanStatus(beratAwalValue, beratBadanValue);

    setState(() {
      recordedData.add('$selectedMonth, $beratAwal, $beratBadan, $status');
      beratAwalController.clear();
      beratBadanController.clear();
      pencatatanTitle =
          'Pencatatan - Bulan: $selectedMonth, BBA: $beratBadan, BBSI: $beratAwal, Status: $status';
    });

    _saveRecordedData();
  }

  String _tentukanStatus(double beratAwal, double beratBadan) {
    if (beratAwal < beratBadan) {
      return 'Naik';
    } else if (beratAwal > beratBadan) {
      return 'Turun';
    } else {
      return 'Sama';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildInputContainer(bulanLabel, selectedMonth),
            SizedBox(height: 30),
            _buildInputContainer(
              beratAwalLabel,
              "Masukkan berat badan awal (BBA)",
              beratAwalController,
            ),
            SizedBox(height: 30),
            _buildInputContainer(
              beratBadanLabel,
              "Masukkan Berat badan saat ini (BBSI)",
              beratBadanController,
            ),
            SizedBox(height: 30),
            _buildSaveButton(),
            SizedBox(height: 20),
            _buildPencatatanStatus(),
          ],
        ),
      ),
    );
  }
}
