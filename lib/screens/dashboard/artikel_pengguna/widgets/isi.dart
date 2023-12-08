import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'artikel_item.dart';

class Isi extends StatefulWidget {
  final void Function(String) onItemClick;

  Isi({required this.onItemClick});

  @override
  _IsiState createState() => _IsiState();
}

class _IsiState extends State<Isi> {
  late List<String> searchResult;
  late List<String> allItems = [];

  @override
  void initState() {
    super.initState();
    allItems = [
      'Senam Hamil: Tips dan manfaat untuk kehamilan yang sehat',
      'Judul Artikel 2',
      'Judul Artikel 3',
      'Judul Artikel 4'
    ];
    searchResult = List.from(allItems);
  }

  void filterList(String query) {
    setState(() {
      searchResult = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 130,
      child: Opacity(
        opacity: 0.60,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Color(0xFFDBD8D9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GFSearchBar(
                searchList: allItems,
                searchQueryBuilder: (String? query, List<String> list) {
                  filterList(query ?? '');
                  return searchResult;
                },
                overlaySearchListItemBuilder: (String? item) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      item ?? '',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
                onItemSelected: (item) {
                  widget.onItemClick(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
