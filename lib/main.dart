import 'package:flutter/material.dart';
import 'package:card_snap_ar_client_side/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Snap AR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LaunchScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        // Add more routes as needed
      },
    );
  }
}

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(), // Set constraints to fill the screen
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF9ED1FF), // Light blue
              Color(0xFFFF9EC4), // Light pink
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Card Snap AR',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20), // Adjust spacing between title and slogan
            const Text(
              'Create personalized AR card gifts',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80), // Adjust spacing between slogan and button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // Navigate to the login screen
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 60),
                primary: Colors.transparent, // Transparent background
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded button border
                  side: const BorderSide(
                    color: Colors.blueGrey,
                    width: 2,
                  ),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

