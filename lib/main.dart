import 'package:flutter/material.dart';
import 'package:snaft/const.dart';
import 'package:snaft/ui/home/home_screen.dart';

void main() {
  runApp(const Snaft());
}
 
class Snaft extends StatelessWidget {
  const Snaft({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snaft',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Signika',

        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: textColor
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: textColor,
            fontFamily: 'Signika',
            fontSize: 22
          )
        ),

        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: textColor),
          bodySmall: TextStyle(color: textColor)
        ),
      ),

      initialRoute: '/',

      routes: {
        '/' : (context) => const HomeScreen(),
        '/search' : (context) => const HomeScreen(),
        '/favorite' : (context) => const HomeScreen(),
        '/profile' : (context) => const HomeScreen(),
      },
    );
  }
}