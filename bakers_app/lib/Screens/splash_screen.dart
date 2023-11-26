import 'package:flutter/material.dart';
import 'package:bakers_app/Screens/sign_in.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const SignIn(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
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
                const SizedBox(height: 30),
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
