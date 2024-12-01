import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snaft/const.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset('/assets/icons/fi-rr-home.svg'),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/fi-rr-heart.svg',
          ),
          label: 'Wishlist'
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('/assets/icons/fi-rr-camera.svg'),
          label: 'Cart'
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('/assets/icons/fi-rr-settings.svg'),
          label: 'Settings'
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('/assets/icons/fi-rr-user.svg'),
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