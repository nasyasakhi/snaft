import 'package:flutter/material.dart';
import 'package:snaft/const.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/empty.png',
                  height: 300,
                  width: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: defaultPadding),
                const Text(
                  "You Haven't Take Any Recipes",
                  style: mainTitle,
                ),
                const Text(
                  "You don’t save any recipes. Go ahead, take your favorite food as recipe.",
                  style: subMainTitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}