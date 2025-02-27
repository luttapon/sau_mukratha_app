import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sau_mukratha_app/views/home_ui.dart';
import 'package:sau_mukratha_app/views/splash_screen_ui.dart';


void main() {
  runApp(MukrathaApp());
}

class MukrathaApp extends StatefulWidget {
  const MukrathaApp({super.key});
  

  @override
  State<MukrathaApp> createState() => _MukrathaAppState();
}


class _MukrathaAppState extends State<MukrathaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
