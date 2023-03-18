import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/ui/screens/signin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/onboardingimg1.png',
                          width: 270,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Finding Your\nDream Job",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Search and Find your dream job easily and quickly",
                          style: GoogleFonts.lato(
                            color: Colors.grey[400],
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/onboardingimg2.png',
                        width: 270,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Get Your\nDream Job",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          "Get your dream job and start working in a new company",
                          style: GoogleFonts.lato(
                              color: Colors.grey[400],
                              fontSize: 16,
                              height: 1.5)),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/onboardingimg3.png',
                        width: 270,
                      ),
                      Text(
                        "Join and Smart\nYour Work",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Welcome to the journey of finding your dream job",
                          style: GoogleFonts.lato(
                              color: Colors.grey[400],
                              fontSize: 16,
                              height: 1.5)),
                    ],
                  ),
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
                        ? const Text('Next',
                            style: TextStyle(color: Colors.black))
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 30.0, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                  offset: Offset(
                                    10.0, // Move to right 5  horizontally
                                    10.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ],
                              color: darkBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text('Start',
                                style: TextStyle(color: Colors.white)),
                          )),
                //SizedBox(height: 24)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
