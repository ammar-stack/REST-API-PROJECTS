import 'package:flutter/material.dart';
import 'package:weather_app_new/Pages/homescreen.dart';
import 'package:weather_app_new/Pages/result.dart';
import 'package:weather_app_new/Pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/" : (context) => const SplashScreen(),
        "/home" : (context) => const HomeScreen(),
        "/result" : (context) =>  ResultScreen()
      },
    );
  }
}
