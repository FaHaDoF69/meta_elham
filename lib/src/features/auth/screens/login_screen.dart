import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      *
      * Background image
      *
      * */
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background/bg_green.png'),
              // Background image
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacing
              SizedBox(
                height: 80,
              ),

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
              SizedBox(height: 30),

              // Screen Title
              Text(
                'تسجيل الدخول',
                style: TextStyle(fontSize: 18),
              ),

              // Spacing
              SizedBox(height: 50),

              // Email input field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "example@gmail.com",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              /*
              *
              * Login Button with gradient colors
              *
              * */
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6FE6A5), Color(0xFF277591)],
                    // Start and end colors for the gradient
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    // Transparent to let the gradient show through
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Spacing
              SizedBox(height: 20),

              // Navigate to create new account screen
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, '/signup'); // Navigate to signup screen
                },
                child: Text(
                  "سجل حساب جديد",
                  style: TextStyle(color: Colors.blue),
                ),
              ),

              // Spacer to make pattern at the bottom of the screen
              const Spacer(),

              // Puzzle Pattern design at the bottom
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
      ),
    );
  }
}
