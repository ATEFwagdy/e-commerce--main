import 'package:e_commerce/screens/auth/loginScreen.dart';
import 'package:e_commerce/screens/auth/onboardingScreen.dart';
import 'package:e_commerce/screens/auth/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:false,
      home:SplashScreen(),
      theme:ThemeData(
          textTheme: GoogleFonts.aBeeZeeTextTheme(
            Theme.of(context).textTheme,
          )
      ),
    );
  }
}