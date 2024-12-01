// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(
            backgroundColor: MaterialStatePropertyAll(Colors.blueGrey.shade300),
          )
        ],
      ),
    );
  }
}