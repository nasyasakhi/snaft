import 'package:flutter/material.dart';
import 'package:snaft/const.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Wishlist'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt_rounded),
          label: 'Cart'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_rounded),
          label: 'Settings'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile'
        )
      ],
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: textColorSmall, 
      onTap: onItemTapped,
    );
  }
}