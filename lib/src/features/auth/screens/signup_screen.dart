import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background/bg_green.png',
              fit: BoxFit.cover, // Make sure the image covers the entire screen
            ),
          ),

          /*
          *
          * Puzzle pattern
          *
          * */
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Image.asset(
          //     'assets/images/background/pattern_puzzle.png',
          //     // Ensure it covers the entire width
          //     fit: BoxFit.cover,
          //     // Full width
          //     width: MediaQuery.of(context).size.width,
          //   ),
          // ),

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
                      buildTextField("الاسم الأول"),
                      const SizedBox(height: 10),
                      buildTextField("الاسم الأخير"),
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
                      const SizedBox(height: 10),

                      buildTextField("عدد التابعين"),
                      const SizedBox(height: 10),
                      buildTextField("رقم الجوال"),
                      const SizedBox(height: 10),
                      buildTextField("البريد الإلكتروني"),
                    ],
                  ),
                ),
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
                const SizedBox(height: 20),

                // Register Button with Gradient
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6FE6A5), Color(0xFF277591)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20),
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

  // Helper method for text fields
  Widget buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
