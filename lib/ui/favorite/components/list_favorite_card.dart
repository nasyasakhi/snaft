import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snaft/const.dart';
import 'package:snaft/models/recipes.dart';

class ListFavoriteCard extends StatelessWidget {
  const ListFavoriteCard({super.key, required this.recipes});

  final Recipes recipes;

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusSizeMine),
        side: BorderSide(
          width: 1,
          color: textColorSmall.withOpacity(.2)
        )
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(borderRadiusSizeMine),
              bottomLeft: Radius.circular(borderRadiusSizeMine)
            ),
            child: Image.asset(
              recipes.image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),     
          const SizedBox(width: defaultPadding),   
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${recipes.calory} kcal",
                style: const TextStyle(
                  fontSize: 16,
                  color: primaryColor
                ),
              ),
              Text(
                recipes.title,
                style: cardTitle,
              ),
              const SizedBox(height: defaultPadding / 2),
              Text(
                recipes.subtitle,
                style: cardText,
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/icons/fi-sr-bookmark.svg',
            colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
          const SizedBox(width: defaultPadding)
        ],
      ),
    );
  }
}