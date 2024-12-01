import 'package:flutter/material.dart';
import 'package:snaft/const.dart';
import 'package:snaft/models/recipes.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.recipes, required this.title, required this.subtitle, required this.image});

  final Recipes recipes;
  final String title, subtitle, image;


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: SizedBox(
        width: 250,
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.only(
            right: defaultPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusSizeMine),
            side: BorderSide(
              width: 1,
              color: textColorSmall.withOpacity(.2)
            )
          ),
          elevation: 0,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(borderRadiusSizeMine),
                  topRight: Radius.circular(borderRadiusSizeMine)
                  ),
                child: Hero(
                  tag: "${recipes.id}", 
                  child: Image.asset(recipes.image)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipes.title,
                      style: cardTitle,
                    ),
        
                    Text(
                      recipes.subtitle,
                      style: cardText,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}