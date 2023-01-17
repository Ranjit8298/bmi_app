import 'dart:async';

import 'package:bmi_app/screens/bmi_user_input_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), (() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return BmiUserInputScreen();
      }));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Container(
              width: 150,
              height: 150,
              alignment: Alignment.center,
              child: Image.asset('assets/images/bmi.png')),
        ),
      ),
    );
  }
}
