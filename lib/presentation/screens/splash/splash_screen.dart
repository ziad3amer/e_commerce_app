import 'package:e_commerce_app/presentation/screens/on_bording/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _navigatorAfterSplash();
    super.initState();
  }

  void _navigatorAfterSplash() async {
    await Future.delayed(Duration(seconds: 2));
    final prefs =await SharedPreferences.getInstance();

    final onboardingCompleted =
        prefs.getBool('onboardingCompleted') ?? false;
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return onboardingCompleted
              ? LoginScreen()
              : OnboardingScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/image/splash_screen2.svg",
      // width: double.infinity,
      // fit: BoxFit.fill,
    );
  }
}
