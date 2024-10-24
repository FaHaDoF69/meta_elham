import 'package:flutter/material.dart';
import 'package:meta_elham_flutter/src/features/shared/widgets/custom_button_widget.dart';
import 'package:meta_elham_flutter/src/features/shared/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ),
          ),

          /*
          *
          * Form
          *
          * */
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50), // Top padding
                // Meta Elham Logo
                Image.asset(
                  'assets/images/logo/logo_white.png',
                  height: 150,
                ),
                const SizedBox(height: 20),

                /*
                 * Page title
                 * */
                const Text(
                  "تسجيل حساب جديد",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Form Fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First name field
                      const CustomTextFieldWidget(
                        label: 'الاسم الأول',
                      ),
                      const SizedBox(height: 10),

                      // Last name field
                      const CustomTextFieldWidget(
                        label: "الاسم الأخير",
                      ),

                      // Spacer
                      const SizedBox(height: 10),

                      // Guardian type
                      const Text("ولي الأمر:", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('الأب'),
                              leading: Radio(
                                value: 'father',
                                groupValue: 'guardian',
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('الأم'),
                              leading: Radio(
                                value: 'mother',
                                groupValue: 'guardian',
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Spacer
                      const SizedBox(height: 10),

                      // Children count
                      const CustomTextFieldWidget(label: "عدد التابعين"),

                      // Spacer
                      const SizedBox(height: 10),

                      // Phone number field
                      const CustomTextFieldWidget(label: "رقم الجوال"),

                      // Spacer
                      const SizedBox(height: 10),

                      // Email field
                      const CustomTextFieldWidget(label: "البريد الإلكتروني"),
                    ],
                  ),
                ),

                // Spacer
                const SizedBox(height: 20),

                // Terms and Conditions
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text.rich(
                    TextSpan(
                      text: "بالتسجيل فأنا أوافق على سياسات منصة ",
                      children: [
                        TextSpan(
                          text: "ميتا إلهام التعليمية",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),

                // Spacer
                const SizedBox(height: 20),

                // Register Button with Gradient
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButtonWidget(
                      buttonText: "تسجيل الدخول",
                      // TODO change gradient colors and text color according
                      gradientColors: const [
                        Color(0xFF6FE6A5),
                        Color(0xFF277591)
                      ],
                      textColor: Colors.white,
                      onPressed: () {
                        // Navigate to otp screen
                        Navigator.pushNamed(context, '/otp');
                      },
                    )),

                /*
                *
                * Puzzle pattern
                *
                * */
                Image.asset(
                  'assets/images/background/pattern_puzzle.png',
                  // Ensure it covers the entire width
                  fit: BoxFit.cover,
                  // Full width
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
