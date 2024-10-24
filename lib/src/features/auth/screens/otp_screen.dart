import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../shared/widgets/custom_button_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Move the following code OtpTextField widget
    Color accentPurpleColor = Color(0xFF6A53A1);
    Color primaryColor = Color(0xFF121212);
    Color accentPinkColor = Color(0xFFF99BBD);
    Color accentDarkGreenColor = Color(0xFF115C49);
    Color accentYellowColor = Color(0xFFFFB612);
    Color accentOrangeColor = Color(0xFFEA7A3B);

    TextStyle? createStyle(Color color) {
      ThemeData theme = Theme.of(context);
      return theme.textTheme.displaySmall?.copyWith(color: color);
    }

    var otpTextStyles = [
      createStyle(accentPurpleColor),
      createStyle(accentYellowColor),
      createStyle(accentDarkGreenColor),
      createStyle(accentOrangeColor),
      createStyle(accentPinkColor),
      createStyle(accentPurpleColor),
    ];

    return Scaffold(
      body: Stack(
        children: [
          /*
          * Background Image
          * */
          Positioned.fill(
            child: Image.asset(
              'assets/images/background/bg_green.png',
              fit: BoxFit.cover,
            ),
          ),

          /*
          * Puzzle pattern at the bottom
          * */
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/background/pattern_puzzle.png',
              fit: BoxFit.contain,
            ),
          ),

          /*
          *
          * Main Content Area
          *
          * */
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo at the top
                Image.asset(
                  'assets/images/logo/logo_text_dark.png',
                  width: 200, // Adjust the size of the logo
                ),
                const SizedBox(height: 50),
                // OTP Instruction Text
                const Text(
                  'أدخل الرقم المكون من 6 أرقام الذي نرسله',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),

                // Spacing
                const SizedBox(height: 20),

                /*
                *
                * OTP Input Field
                *
                * */
                Directionality(
                  textDirection: TextDirection.ltr, // Force LTR
                  child: OtpTextField(
                    numberOfFields: 6,
                    borderColor: accentPurpleColor,
                    focusedBorderColor: accentPurpleColor,
                    styles: otpTextStyles,
                    showFieldAsBox: false,
                    borderWidth: 4.0,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here if necessary
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {},
                  ),
                ),

                // Spacing
                const SizedBox(height: 50),

                // Confirmation Button
                CustomButtonWidget(
                  // TODO change lang
                  buttonText: "تأكيد",
                  // TODO change gradient colors and text color according
                  gradientColors: const [Color(0xFF01EBC0), Color(0xFF0A6273)],
                  textColor: Colors.white,
                  onPressed: () {
                    // Navigate to otp screen
                    Navigator.pushReplacementNamed(
                        context, '/parent_dashboard');
                  },
                ),

                const SizedBox(height: 10),

                // TODO update the style
                // Resend Code Button
                TextButton(
                  onPressed: () {
                    // TODO: Add resend OTP logic
                  },
                  child: const Text('إعادة إرسال الرمز'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
