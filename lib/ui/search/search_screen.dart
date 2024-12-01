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
            
          ],
        ),
      ),
    );
  }
}