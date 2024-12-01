import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:snaft/const.dart';
import 'package:snaft/ui/favorite/components/empty_favorite.dart';
import 'package:snaft/ui/favorite/components/favorite_from_community.dart';

class FavoriteTabController extends StatelessWidget {
  const FavoriteTabController({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            SegmentedTabControl(
              barDecoration: BoxDecoration(
                color: secondaryColorThin,
                borderRadius: BorderRadius.circular(borderRadiusSizeMine)
              ),
              indicatorDecoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(borderRadiusSizeMine)
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontFamily: 'Signika',
              ),
              tabs: [
                const SegmentTab(
                  label: "From Community"),
                const SegmentTab(label: "My Recipes"),
              ]
            ),
            const Padding(
              padding: EdgeInsets.only(top: defaultPadding * 4),
              child: TabBarView(
                children: [
                  FavoriteFromCommunity(),
                  EmptyFavorite()
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}