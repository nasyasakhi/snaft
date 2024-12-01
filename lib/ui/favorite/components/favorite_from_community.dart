import 'package:flutter/material.dart';
import 'package:snaft/models/recipes.dart';
import 'package:snaft/ui/favorite/components/list_favorite_card.dart';

class FavoriteFromCommunity extends StatelessWidget {
  const FavoriteFromCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Recipes.recipes.length,
      itemBuilder: (context, index) {
        final recipe = Recipes.recipes[index];
        return ListFavoriteCard(
          recipes: recipe
        );
      },
    );
  }
}