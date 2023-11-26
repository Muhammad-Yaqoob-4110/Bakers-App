import 'package:flutter/material.dart';
import 'package:bakers_app/Pages/home_page.dart';
import 'package:bakers_app/APIs/signup_api.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var username = '';
    var email = '';
    var password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              './assets/icons/signup.png',
              height: 100,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'UserName'),
              onChanged: (value) {
                username = value;
              },
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                signupUser(
                        url: "http://localhost:3005/api/user",
                        username: username,
                        email: email,
                        password: password)
                    .then((responseData) {
                  final message = responseData["message"];
                  if (message == "Signup successfully") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                }).catchError((error) {
                  print('Error during login: $error');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'An error occurred during sign up. Please try again later.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                });

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
