import 'dart:async';
import 'package:clean_architecture_news_app/features/news/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/splash_1.png",
            fit: BoxFit.scaleDown,
            width: width,
            height: height * 0.5,
          ),
          SizedBox(height: height * 0.06),
          Text(
            "TOP HEADLINES ",
            style: GoogleFonts.anton(
                letterSpacing: 0.6, color: Colors.grey.shade700, fontSize: 18),
          ),
          SizedBox(height: height * 0.04),
          SpinKitWave(
            size: 40,
            color: Colors.grey.shade800,
            type: SpinKitWaveType.start,
            duration: const Duration(seconds: 2),
          ),
        ],
      ),
    );
  }
}
