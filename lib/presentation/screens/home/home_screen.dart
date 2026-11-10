import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: SvgPicture.asset("assets/image/background.svg"),
                  ),
                  Text(
                    "ShopX",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF111827),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Hi, Ziad",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SvgPicture.asset("assets/image/container.svg"),
                ],
              ),
              SizedBox(height: 16),
              Text("What are you looking for?",)
            ],
          ),
        ),
      ),
    );
  }
}
