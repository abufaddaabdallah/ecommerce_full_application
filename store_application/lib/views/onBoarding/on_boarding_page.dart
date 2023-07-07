import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_application/views/home_page.dart';
import 'package:store_application/views/signIn/login_page.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final PageController _pageController = PageController();
  final List<String> _pageImages = [
    "assets/images/on_boarding_1.svg",
    "assets/images/on_boarding_2.svg",
    "assets/images/on_boarding_3.svg",
  ];
  final List<String> _pageTitles = [
    'Discover New Products',
    'Earn Points For Shopping',
    'Get Fast Local Delivery',
  ];
  final List<String> _pageDescriptions = [
    'Many new products are discovered by\n people simply happening upon them\n while being out and about in the\nworld.',
    'The purpose of reward points is to provide\n an incentive for customers to make\n repeat purchases.',
    'Wow Express offers cash on delivery services\n and fast delivery\n services so that your customers.',
  ];

  int _currentPage = 0;

  void _goToNextPage() {
    if (_currentPage < _pageTitles.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      const FlutterSecureStorage().write(
        key: "firstTimeHere",
        value: "false",
      );
      // Future<bool> checkIfFirstTimeUser() async {
      //   FlutterSecureStorage prefs = new FlutterSecureStorage().;
      //   bool firstTimeHere = prefs.getBool('showHelloRoutine') ?? true;
      //   await prefs.setBool('showHelloRoutine', false);
      //   return firstTimeHere;
      // }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    }
  }

  void _goToBackPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum:
            const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage != 0
                    ? TextButton(
                        onPressed: _goToBackPage,
                        child: const Text(
                          'Previous',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Container(),
                TextButton(
                  onPressed: _goToNextPage,
                  child: Text(
                    _currentPage == _pageTitles.length - 1
                        ? 'Get Started'
                        : 'Next',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pageTitles.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SvgPicture.asset(
                          _pageImages[index],
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Text(
                          _pageTitles[index],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        flex: 2,
                        child: Text(
                          _pageDescriptions[index],
                          style: const TextStyle(
                              fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // const SizedBox(height: 16),
            SmoothPageIndicator(
              controller: _pageController,
              count: _pageTitles.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: FlexColor.redM3LightPrimary,
                dotColor: Colors.grey,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 8,
                expansionFactor: 4,
              ),
            ),
            const SizedBox(height: 16),
            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
