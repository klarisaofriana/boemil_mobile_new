import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TombolMenu extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  TombolMenu({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.book, color: Color(0xFFFF71A4)),
          title: Text("Artikel"),
          selectedColor: Color(0xFFFF71A4),
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.calendar_today, color: Color(0xFFFF71A4)),
          title: Text("Jadwal"),
          selectedColor: Color(0xFFFF71A4),
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.pregnant_woman, color: Color(0xFFFF71A4)),
          title: Text("Ukuran Janin"),
          selectedColor: Color(0xFFFF71A4),
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.show_chart, color: Color(0xFFFF71A4)),
          title: Text("Berat Saya"),
          selectedColor: Color(0xFFFF6BA1),
        ),
      ],
    );
  }
}
