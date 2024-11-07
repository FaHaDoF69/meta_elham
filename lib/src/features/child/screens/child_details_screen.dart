import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../parent/screens/widgets/card_children_widget.dart';

class ChildDetailsScreen extends StatelessWidget {
  const ChildDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Body background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background/bg_green.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                // AppBar with its own background image and title "الأبناء" centered
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/background/bg_appbar.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Back Button on the left
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            // Add navigation action
                          },
                        ),
                      ),
                      // Centered Title "الأبناء"
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(right: 40.0),
                            // Optional fine-tuning
                            child: Text(
                              'الأبناء',
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Meta Elham Logo and text
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo/logo_text_dark.png',
                      width: 500,
                      height: 100,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Title "الأبناء"
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'الأبناء:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // List of children profiles
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      buildChildProfile('assets/images/avatars/avatar.png',
                          'مهند', 'المستوى الثاني'),
                      const SizedBox(height: 10),
                      buildChildProfile('assets/images/avatars/avatar.png',
                          'مهند', 'المستوى الثاني'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Add new child button
                ElevatedButton(
                  onPressed: () {
                    // Add child action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0), // Remove default padding
                  ),
                  child: Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF0A6273),
                          Color(0xFF01EBC0),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.add, size: 30, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                // Confirm Button
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomButtonWidget(
                    buttonText: "تأكيد",
                    gradientColors: const [
                      Color(0xFF01EBC0),
                      Color(0xFF0A6273)
                    ],
                    textColor: Colors.white,
                    onPressed: () {
                      // Navigate to otp screen
                      Navigator.pushReplacementNamed(context, '/otp');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
