import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snaft/const.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: BottomNavigationBar(
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/fi-rr-home.svg',
              colorFilter: ColorFilter.mode(selectedIndex != 0 ?  textColorSmall : primaryColor, BlendMode.srcIn),
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/fi-rr-search.svg',
              colorFilter: ColorFilter.mode(selectedIndex != 1 ?  textColorSmall : primaryColor, BlendMode.srcIn),
            ),
            label: 'Explore'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/fi-rr-camera.svg',
              colorFilter: ColorFilter.mode(selectedIndex != 2 ?  textColorSmall : primaryColor, BlendMode.srcIn),
            ),
            label: 'Camera'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/fi-rr-heart.svg',
              colorFilter: ColorFilter.mode(selectedIndex != 3 ?  textColorSmall : primaryColor, BlendMode.srcIn),
            ),
            label: 'Favorite'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/fi-rr-user.svg',
              colorFilter: ColorFilter.mode(selectedIndex != 4 ?  textColorSmall : primaryColor, BlendMode.srcIn),
            ),
            label: 'Profile'
          )
        ],
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: textColorSmall, 
        onTap: onItemTapped,
      ),
    );
  }
}