import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snaft/const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding, top: defaultPadding * 2),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: defaultPadding * 2), 
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/profile/shika_profile.png'),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/fi-rr-crown.svg',
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          width: 24,
                        )
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15), 
                Text(
                  'Shiho Diye',
                  style: textTitle
                ),
                const Text(
                  'Food Blogger',
                  style: subMainTitle
                ),
                const SizedBox(height: defaultPadding * 1.5), 
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    buildMenuItem(
                      icon: 'assets/icons/fi-rr-user.svg',
                      text: 'Edit Profile',
                      context: context,
                    ),
                    buildMenuItem(
                      icon: 'assets/icons/fi-rr-star.svg',
                      text: 'Renew Plans',
                      context: context,
                    ),
                    buildMenuItem(
                      icon: 'assets/icons/fi-rr-settings.svg',
                      text: 'Settings',
                      context: context,
                    ),
                    buildMenuItem(
                      icon: 'assets/icons/fi-rr-shield.svg',
                      text: 'Terms & Privacy Policy',
                      context: context,
                    ),
                    buildMenuItem(
                      icon: 'assets/icons/fi-rr-sign-out.svg',
                      text: 'Log Out',
                      context: context,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String icon,
    required String text,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration:  BoxDecoration(
            color: const Color(0xFFFFE8E0), 
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)
          ),
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(secondaryColor, BlendMode.srcIn),
          ),
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: textColorSmall,
          ),
        ),
        trailing: SvgPicture.asset(
          'assets/icons/fi-rr-angle-small-right.svg',
          colorFilter: const ColorFilter.mode(textColorSmall, BlendMode.srcIn),
        )
      ),
    );
  }
}