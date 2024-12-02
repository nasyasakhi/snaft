import 'package:flutter/material.dart';
import 'package:snaft/const.dart';
import 'package:snaft/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () { // mengeksekusi durasi
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/body');
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); 
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Snaft',
            style: TextStyle(
              fontSize: 65,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
          )
          ],
        ),
      ),
    );
  }
}