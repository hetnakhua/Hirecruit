import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/onboarding1.png',
                      height: 350,
                      width: 350,
                    ),
                    Text(
                      "Dating made easy",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Filtered people based on your interests",
                        style: GoogleFonts.lato()),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/onboarding2.png',
                      height: 350,
                      width: 350,
                    ),
                    Text(
                      "Dating made quick",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "You have 24 hours to chat, its a blind date after all!",
                        style: GoogleFonts.lato()),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/onboarding3.png',
                      height: 350,
                      width: 350,
                    ),
                    Text(
                      "Dating made safe",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Leave your worries aside and find love <3",
                        style: GoogleFonts.lato()),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            // alignment: Alignment.center,
            bottom: 60,
            left: MediaQuery.of(context).size.width * 0.5 - 32,
            child: Column(
              children: [
                SizedBox(height: 24),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(
                  flex: 1,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: currentPage.round(),
                  count: 3,
                  effect: WormEffect(
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.indigo),
                ),
                Spacer(
                  flex: 5,
                ),
                MaterialButton(
                    height: MediaQuery.of(context).size.width * 0.13,
                    minWidth: MediaQuery.of(context).size.width * 0.3,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      setState(() {
                        currentPage != 2
                            ? _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              )
                            : Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => SignInScreen(),
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ),
                              );
                      });
                    },
                    child: currentPage != 2
                        ? const Text('    Next',
                            style: TextStyle(color: Colors.black))
                        : Image.asset("assets/get sparked.png",
                            height: MediaQuery.of(context).size.width * 0.06)),
                //SizedBox(height: 24)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
