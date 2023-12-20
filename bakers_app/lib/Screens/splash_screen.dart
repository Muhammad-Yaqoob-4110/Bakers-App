//This is the splash screen.
//The first intro screen of this bakery application.
//It show the intro for first 5 seconds then navigate to the next page.

import 'package:flutter/material.dart';
import 'package:bakers_app/Pages/bottom_navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Delay navigation to the sign in screen for 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => BottomNavigationPage(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand, //fill the entire screen
        children: [
          // Background Image
          Image.asset(
            './assets/cover-11.png',
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // bakery logo
                Image.asset(
                  './assets/bakers.png',
                  height: 100,
                ),
                const SizedBox(height: 30), //sizedbox for vertical space
                const Text(
                  'Welcome to My Bakery!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 0, 4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
