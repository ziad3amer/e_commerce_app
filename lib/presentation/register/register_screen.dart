import 'package:e_commerce_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/custom_elevated_button.dart';
import '../widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              title: Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),
              centerTitle: true,
            ),
            SizedBox(height: 12),
            Text(
              "Join us and start shopping",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF9CA3AF),
              ),
            ),
            SizedBox(height: 12),
            Stack(
              children: [
                Container(
                  child: SvgPicture.asset("assets/image/circular_avatar.svg"),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: Material(
                    color: Color(0xFF15B86C),
                    shape: CircleBorder(),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            CustomTextField(
              controller: _nameController,
              title: "Full Name",
              hintText: "Enter your full name",
            ),
            SizedBox(height: 15),
            CustomTextField(
              controller: _emailController,
              title: "Email Address",
              hintText: "ziad@gmail.com",
            ),
            SizedBox(height: 15),
            CustomTextField(
              controller: _passwordController,
              title: "Password",
              hintText: "Create a password",
              obscureText: true,
            ),
            SizedBox(height: 15),
            CustomTextField(
              controller: _passwordController,
              title: "Confirm Password",
              hintText: "Confirm your Password",
              obscureText: true,
            ),
            SizedBox(height: 22),
            CustomElevatedButton(
              text: 'Create Account',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Color(0xFF059669)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
