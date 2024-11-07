import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../auth/screens/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            // Static background image covering the entire screen
            Positioned.fill(
              child: Image.asset(
                'assets/images/background/bg_green_dark.png',
                // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),

            // PageView for text and image content
            PageView(
              controller: _pageController,
              children: [
                // First page content
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Changing image for the first page
                        Image.asset(
                          'assets/images/hello.png',
                          // Replace with your image asset path
                          width: 230,
                          height: 230,
                          // fit: BoxFit.,
                        ),
                        const SizedBox(height: 20),
                        // Title
                        const Text(
                          'ميتا إلهام هو تطبيق تم تصميمه خصيصاً لدعم الأطفال ذوي اضطراب التوحد وأسرهم. نسعى لتقديم تجربة تعليمية ممتعة وتفاعلية من خلال أنشطة مصممة بعناية لمساعدة طفلك على النمو والتعلم بطرق مبتكرة وآمنة.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        // Description
                      ],
                    ),
                  ),
                ),

                // Second page content
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Changing image for the second page
                        Image.asset(
                          'assets/images/onboared2.png',
                          // Replace with your image asset path
                          width: 230,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 20),
                        // Title
                        const Text(
                          'يحتوي ميتا إلهام على مجموعة متنوعة من الأنشطة التعليمية والألعاب التفاعلية، كما يوفر أدوات لتمكين الوالدين من متابعة تقدم الطفل وفهم احتياجاته التعليمية والسلوكية',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        // Description
                      ],
                    ),
                  ),
                ),

                // Third page content
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Changing image for the third page
                        Image.asset(
                          'assets/images/onboared3.png',
                          // Replace with your image asset path
                          width: 230,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 50),
                        // Title
                        const Text(
                          'دورك كوالد في هذه الرحلة مهم جداً! يساعدك التطبيق على تتبع تقدم طفلك وتخصيص الأنشطة وفقاً لاحتياجاته الخاصة، كما يمكنك توفير معلومات إضافية تساعدنا على تقديم الدعم الأفضل له.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        // Description
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Skip button at the top right
            Positioned(
              top: 40,
              right: 30,
              child: TextButton(
                onPressed: () {
                  // LoginScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),

            // Page indicator at the bottom center
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                    dotHeight: 10,
                    dotWidth: 10,
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
