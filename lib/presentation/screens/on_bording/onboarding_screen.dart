import 'package:e_commerce_app/presentation/screens/on_bording/widget/onboarding_page.dart';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import 'model/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  static final List<OnboardingModel> _pages = [
    OnboardingModel(
      image: 'assets/image/market.svg',
      title: 'Discover Products',
      description:
          'Explore thousands of products from top\nbrands and sellers.',
      textButton: 'Next',
    ),
    OnboardingModel(
      image: 'assets/image/woman_shopping.svg',
      title: 'Easy & Fast Shopping',
      description: 'Shop with ease, save time and enjoy\nthe best deals.',
      textButton: 'Next',
    ),
    OnboardingModel(
      image: 'assets/image/delivery_truck.svg',
      title: 'Get Your Products\nDelivered',
      description: 'Fast and reliable delivery to your\ndoorstep.',

      textButton: 'Get Started',
    ),
  ];

  bool get _isLast => _currentPage == _pages.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onButtonPressed() async{
    if (_isLast) {
      final prefs =await SharedPreferences.getInstance();
      await prefs.setBool("onboardingCompleted", true);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginScreen();
          },
        ),
      );
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (_, i) => OnboardingPage(model: _pages[i]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == i ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == i
                        ? const Color(0xFF00A86B)
                        : const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00A86B),
                  ),
                  child: Text(
                    _pages[_currentPage].textButton,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
