import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/images/saulogo.png',
              width: 250,
            ),
            SizedBox(height: 20),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'แอปพริเคชันกระทะ',
            ),
            SizedBox(height: 5),
            Text(
              'เพื่อคนไทย',
            ),
            SizedBox(height: 5),
            Text(
              'โดยเด็กไทย',
            ),
            SizedBox(height: 5),
            Text(
              'สนใจแอปพริเคชันติดต่อ',
            ),
            SizedBox(height: 5),
            Text(
              'เด็กไอที SAU',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _makePhoneCall('1112');
              },
              child: Image.asset(
                'assets/images/sauqr.png',
                width: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
