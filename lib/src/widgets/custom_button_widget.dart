// CustomButtonWidget is a reusable widget that creates a button with customizable text, gradient colors, and text color.
// It is designed to be used across the application for consistent button styles.
import 'package:flutter/material.dart';

/*
*
* reusable widget that creates a button with customizable :
*   1- text
*   2- gradient
*   3- colors
*   4- text color
*   
* */
class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color textColor;

  // gradientColors: A list of colors used to create a gradient background for the button.
  final List<Color> gradientColors;

  // onPressed: A callback function that is executed when the button is tapped.
  final VoidCallback onPressed;

  // Constructor for CustomButtonWidget.
  const CustomButtonWidget({
    super.key,
    required this.buttonText,
    required this.gradientColors,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    /*
    *
    * Container used to apply a background gradient
    * and rounded corners to the button.
    *
    * */
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(15),
      ),

      /*
      *
      * ElevatedButton button with custom styling
      *
      * */
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          // Transparent background color to allow the gradient to show through.
          shadowColor: Colors.transparent,
          // Transparent shadow color to remove the default button shadow.
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(30), // Rounded corners for the button.
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 15), // Padding for the button's vertical space.
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 18,
            color: textColor, // Color of the text.
          ),
        ),
      ),
    );
  }
}
