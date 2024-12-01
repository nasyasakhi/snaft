// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:snaft/const.dart';
import 'package:snaft/models/recipes.dart';
import 'package:snaft/ui/search/components/menu_card.dart';
import 'package:snaft/ui/search/components/searchbar_section.dart';
import 'package:snaft/ui/search/components/trending_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore More"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding * 2),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchbarSection(),
                const SizedBox(height: defaultPadding * 2),
                const Text(
                  "Hot Now",
                  style: subTitle,
                ),
                const SizedBox(height: defaultPadding),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Recipes.recipes.length,
                    itemBuilder: (BuildContext context, int index) {
                      final recipe = Recipes.recipes[index];
                      return MenuCard(
                        recipes: recipe, 
                        title: recipe.title, 
                        subtitle: recipe.subtitle, 
                        image: recipe.image
                      );
                    }
                  ),
                ),
                const SizedBox(height: defaultPadding * 2),
                const Text(
                  "Trending",
                  style: subTitle,
                ),
                const SizedBox(height: defaultPadding),
                TrendingList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}