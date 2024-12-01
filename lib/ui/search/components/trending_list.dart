import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snaft/const.dart';

class TrendingList extends StatelessWidget {
  TrendingList({super.key});

  List<String> trendingList = [
    "Best vegetable recipes",
    "Cool season vegetables",
    "Chicken recipes with eggs",
    "Soups",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52 * trendingList.length.toDouble(),
      child: ListView.builder(
        itemCount: trendingList.length,
        itemBuilder:(context, index) => _trendingLisst(index)),
    );
  }

  Widget _trendingLisst(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: Row(
      children: [
        Text(
          trendingList[index],
          style: linkText,
        ),
        const SizedBox(width: defaultPadding),
        SvgPicture.asset(
          'assets/icons/fi-rr-chat-arrow-grow.svg',
          colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
          width: 18,
        )
      ],
        ),
    );
  }
}