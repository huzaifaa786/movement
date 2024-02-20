import 'package:academy_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7F7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image
            Image.asset(
              'assets/images/intro.png', // Replace 'intro_image.png' with your image asset path
              width: 450,
              height: 300,
            ),
            SizedBox(height: 20), // Spacer

            // Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal :24.0),
              child: Text(
                'The Movement App is an app and a platform that gives you access to a new paradigm-shifting perspective when it comes to developing and enhancing your movement capabilities and your physical and mental well-being. The Movement App is for anyone ready to immerse themselves into the world of movement.',
                textAlign: TextAlign.justify,
              
                style: TextStyle(
                  
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // Button
            ElevatedButton(
              onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const TabsScreen()));
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
