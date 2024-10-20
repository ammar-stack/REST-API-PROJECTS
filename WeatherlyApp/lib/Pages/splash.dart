import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_new/Components/spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 7), moveToHome);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/weather_logo.svg',
              height: 230,
              width: 230,
            ),
            VerticalSpacing(height: 50.0),
            Text(
              'Weatherly',
              style: GoogleFonts.aBeeZee(
                  color: const Color(0xff37A043),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            VerticalSpacing(height: 60.0),
            const CircularProgressIndicator(
              color: Color(0xff37A043),
              strokeWidth: 4.0,)
          ],
        ),
      ),
    );
  }
  moveToHome(){
    Navigator.pushReplacementNamed(context, '/home');
  }
}
