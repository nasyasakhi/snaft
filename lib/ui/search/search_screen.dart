// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:snaft/const.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding * 2),
        child: Column(
          children: [
            SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  backgroundColor: MaterialStatePropertyAll(Colors.blueGrey.shade50),
                  shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: defaultPadding / 2, horizontal: defaultPadding)
                  ),
                  hintText: 'Search recipes, articles, people...',
                  hintStyle: const MaterialStatePropertyAll<TextStyle>(
                    TextStyle(
                      color: textColorSmall,
                    )
                  ),
                  
                  // TODO - ganti Icon sama svg
                  leading: const Icon(Icons.search),
                );
              },
              suggestionsBuilder: (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}