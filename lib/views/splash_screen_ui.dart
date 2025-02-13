import 'package:flutter/material.dart';
import 'package:sau_mukratha_app/views/home_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUi(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/images/logo.png",
                  width: MediaQuery.of(context).size.width * 0.8),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(height: 40),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              'Copyright © 2024 luttapon',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(height: 10),
            Text(
              '༼ つ ◕_◕ ༽つ',
              style: TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
