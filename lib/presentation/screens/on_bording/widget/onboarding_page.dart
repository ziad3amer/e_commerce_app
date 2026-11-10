import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.model});

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding:  EdgeInsets.all(50),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120,),
            Center(child: SvgPicture.asset(model.image)),
            SizedBox(height: 40),
            Text(
              model.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
                color: Color(0xFF171717),
              ),
            ),
            SizedBox(height: 12),
            Text(
              model.description,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Color(0xFF171717),
              ),
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }
}
