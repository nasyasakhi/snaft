import 'package:flutter/material.dart';
import 'package:snaft/const.dart';
import 'package:snaft/ui/favorite/components/favorite_tab_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Recipes"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding * 2),
        child: FavoriteTabController(),
      ),
    );
  }
}