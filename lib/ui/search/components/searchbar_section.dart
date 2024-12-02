import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snaft/const.dart';

class SearchbarSection extends StatefulWidget {
  const SearchbarSection({super.key});

  @override
  State<SearchbarSection> createState() => _SearchbarSectionState();
}

class _SearchbarSectionState extends State<SearchbarSection> {
  final List<String> _searchHistory = []; // Simpan riwayat pencarian

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          backgroundColor: WidgetStatePropertyAll(Colors.blueGrey.shade50),
          shadowColor: const WidgetStatePropertyAll(Colors.transparent),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: defaultPadding / 2, horizontal: defaultPadding)
          ),
          hintText: 'Search recipes, articles, people...',
          hintStyle: const WidgetStatePropertyAll<TextStyle>(
            TextStyle(
              color: textColorSmall,
            )
          ),
                  
          leading: SvgPicture.asset(
            'assets/icons/fi-rr-search.svg',
            colorFilter: const ColorFilter.mode(textColorSmall, BlendMode.srcIn),
          ),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        final String keyword = controller.text;

        // Buat suggestion dinamis berdasarkan keyword
        final List<String> suggestions = keyword.isEmpty
        ? _searchHistory
        : [controller.text];

      return suggestions.map((suggestion) {
          return Container(
            color: Colors.blueGrey.shade50, // Warna latar belakang
            child: ListTile(
              title: Text(suggestion),
              onTap: () {
                setState(() {
                  if (!_searchHistory.contains(suggestion)) {
                    _searchHistory.add(suggestion);
                  } 
                  controller.closeView(suggestion);
                });
              },
            ),
          );
        }).toList();

      },
    );
  }
}