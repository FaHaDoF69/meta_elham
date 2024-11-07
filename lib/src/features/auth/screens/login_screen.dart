import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      *
      * Background image
      *
      * */
      body: Stack(
        children: [
          /*
          *
          * Background Image
          *
          * */
          Positioned.fill(
            child: Image.asset(
              'assets/images/background/bg_green.png',
              fit: BoxFit.cover, // Make sure the image covers the entire screen
              // height: MediaQuery.of(context).size.height,
            ),
          ),

          /*
          *
          * Puzzle pattern
          *
          * */
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/background/pattern_puzzle.png',
              // Ensure it covers the entire width
              fit: BoxFit.cover,
              // Full width
              width: MediaQuery.of(context).size.width,
              colorBlendMode: BlendMode.srcOver, // Apply color overlay
              // To apply little transparency
              color: const Color.fromRGBO(255, 255, 255, 0.1),
            ),
          ),

          /*
          *
          * Form
          *
          * */
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*
                  *
                  * Meta Elham Logo with text
                  *
                  * */
                  Image.asset(
                    'assets/images/logo/logo_white.png',
                    height: 180,
                  ),

                  // Spacing
                  const SizedBox(height: 30),

                  // Screen Title
                  const Text(
                    'تسجيل الدخول',
                    style: TextStyle(fontSize: 18),
                  ),

                  // Spacing
                  const SizedBox(height: 50),

                  // Email input field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    // child: TextField(
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(Icons.email),
                    //     hintText: "example@gmail.com",
                    //     filled: true,
                    //     fillColor: Colors.white,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30.0),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //   ),
                    // ),
                    child: CustomTextFieldWidget(
                      hint: 'example@gmail.com',
                    ),
                  ),

                  const SizedBox(height: 30),

                  /*
                  *
                  * Login Button with gradient colors
                  * TODO use custom gradient widget
                  * */
                  // Container(
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       colors: [Color(0xFF6FE6A5), Color(0xFF277591)],
                  //       // Start and end colors for the gradient
                  //       begin: Alignment.topCenter,
                  //       end: Alignment.bottomCenter,
                  //     ),
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       elevation: 0,
                  //       backgroundColor: Colors.transparent,
                  //       // Transparent to let the gradient show through
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.pushReplacementNamed(context, '/otp');
                  //     },
                  //     child: Text(
                  //       "تسجيل الدخول",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // Confirmation Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButtonWidget(
                      // TODO change lang
                      buttonText: "تأكيد",
                      // TODO change gradient colors and text color according
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

                  // Spacing
                  const SizedBox(height: 20),

                  // Navigate to create new account screen
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/signup'); // Navigate to signup screen
                    },
                    child: const Text(
                      "سجل حساب جديد",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
