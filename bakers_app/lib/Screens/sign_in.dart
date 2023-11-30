import 'package:flutter/material.dart';
import 'package:bakers_app/Screens/sign_up.dart';
import 'package:bakers_app/Pages/bottom_navigation.dart';
import 'package:bakers_app/APIs/login_api.dart';
import 'package:bakers_app/Core/color.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Function to handle login button press
  @override
  Widget build(BuildContext context) {
    var email = '';
    var password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LogIn',
          style: TextStyle(
            color: black, // Change the text color of the title
            fontWeight: FontWeight.bold, // Add bold font weight
          ),
        ),
        backgroundColor: pink01,
      ),
      backgroundColor: pink01,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              './assets/icons/signin.png',
              height: 100,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                //handleLogin(context, email, password);
                // Then navigate to the HomeScreen on button press
                //Navigator.of(context).pushReplacement(
                //MaterialPageRoute(builder: (_) => const HomePage()),
                //);

                loginUser(
                        url: "http://10.5.124.59:3005/api/user/login",
                        email: email,
                        password: password)
                    .then((responseData) {
                  final message = responseData["message"];
                  if (message == "Login successfully.") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigationPage(),
                      ),
                    );
                  }
                }).catchError((error) {
                  print('Error during login: $error');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'An error occurred during login. Please try again later.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                });

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => BottomNavigationPage()),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                // Navigate to the signup screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpScreen()),
                );
              },
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
