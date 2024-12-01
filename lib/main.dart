import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snaft/const.dart';
import 'package:snaft/ui/auth/login_screen.dart';
import 'package:snaft/ui/auth/register_screen.dart';
import 'package:snaft/ui/favorite/favorite_screen.dart';
import 'package:snaft/ui/favorite/components/favorite_tab_controller.dart';
import 'package:snaft/ui/home/home_screen.dart';
import 'package:snaft/ui/profile/profile_screen.dart';
import 'package:snaft/ui/search/search_screen.dart';
import 'package:snaft/ui/splash/components/body.dart';
import 'package:snaft/ui/splash/splash_screen.dart';

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
        scaffoldBackgroundColor: const Color(0xFFF7FAFC),
        fontFamily: 'Signika',
        visualDensity: VisualDensity.adaptivePlatformDensity,

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
        '/i' : (context) => const SplashScreen(),
        '/body' : (context) => const Body(),
        '/login' : (context) => const LoginScreen(),
        '/register' : (context) => const RegisterScreen(),
        '/home' : (context) => const HomeScreen(),
        '/search' : (context) => const SearchScreen(),
        '/' : (context) => const FavoriteScreen(),
        '/profile' : (context) => const ProfileScreen(),
      },
    );
  }
}