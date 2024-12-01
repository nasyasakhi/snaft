import 'package:flutter/material.dart';
import 'package:snaft/const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50), 
          const Text(
            'Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 20),
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
                  child: const Icon(
                    Icons.camera_enhance_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15), 
          const Text(
            'Shiho Diye',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: textColor,
            ),
          ),
          const Text(
            'Food Blogger',
            style: TextStyle(
              fontSize: 16,
              color: textColorSmall,
            ),
          ),
          const SizedBox(height: 30), 
          Expanded(
            child: ListView(
              children: [
                buildMenuItem(
                  icon: Icons.person,
                  text: 'Edit Profile',
                  context: context,
                ),
                buildMenuItem(
                  icon: Icons.star,
                  text: 'Renew Plans',
                  context: context,
                ),
                buildMenuItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  context: context,
                ),
                buildMenuItem(
                  icon: Icons.policy,
                  text: 'Terms & Privacy Policy',
                  context: context,
                ),
                buildMenuItem(
                  icon: Icons.logout,
                  text: 'Log Out',
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
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
          child: Icon(icon, color: secondaryColor),
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: textColorSmall,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: textColorSmall,
          size: 16,
        ),
      ),
    );
  }
}