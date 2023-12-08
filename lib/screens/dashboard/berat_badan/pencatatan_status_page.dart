/* import 'package:flutter/material.dart';

class Pencatatan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Pencatatan',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF222121),
            fontSize: 18,
            fontFamily: 'Karla',
            fontWeight: FontWeight.w700,
            height: 0.11,
          ),
        ),
      ],
    );
  }
}

class PencatatanStatus extends StatelessWidget {
  final List<String> catatanList;
  final double beratAwal;
  final double beratSaatIni;
  final String bulan;

  PencatatanStatus({
    required this.catatanList,
    required this.beratAwal,
    required this.beratSaatIni,
    required this.bulan,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: 302.42,
            height: 263.90,
            child: Stack(
              children: [
                // ... (Bagian ini tidak diubah)
              ],
            ),
          ),
          SizedBox(height: 20),
          _buildCatatanList(),
        ],
      ),
    );
  }

  Widget _buildCatatanList() {
    bool isDataAvailable = catatanList.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catatan List:',
          style: TextStyle(
            color: Color(0xFF8D7F7F),
            fontSize: 16,
            fontFamily: 'Karla',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        SizedBox(height: 10),
        if (isDataAvailable)
          for (String catatan in catatanList) _buildFormattedCatatan(catatan),
        if (!isDataAvailable)
          Text(
            'Data masih kosong',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Crimson Pro',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
      ],
    );
  }

  Widget _buildFormattedCatatan(String catatan) {
    // Split catatan into parts
    List<String> parts = catatan.split(', ');

    // Format catatan based on its content
    String formattedCatatan =
        'Bulan: ${parts[0]}, Berat Badan Saat Ini: ${parts[1]}, Berat Badan Awal: ${parts[2]}';

    return Text(
      formattedCatatan,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Crimson Pro',
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    );
  }
}
 */