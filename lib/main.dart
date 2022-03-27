import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/onboardingScreen/onboarding_screen.dart';
import './screens/homeScreen/home_screen.dart';
import './screens/purchaseScreen/purchase_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Squid Game Shop",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const SquidGameShop(),
    );
  }
}

class SquidGameShop extends StatelessWidget {
  const SquidGameShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingScreen(),
    );
  }
}

void main() {
  runApp(const MyApp());
}
