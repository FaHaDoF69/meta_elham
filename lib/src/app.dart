import 'package:flutter/material.dart';
import 'package:meta_elham_flutter/src/features/auth/screens/otp_screen.dart';
import 'package:meta_elham_flutter/src/features/parent/screens/parent_dashboard_screen.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/signup_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meta Elham App',
      // Set the locale to Arabic
      locale: Locale('ar'),
      // Forces RTL layout
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl, // Force RTL
          child: child!,
        );
      },
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(), // Initial route
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/otp': (context) => OtpScreen(),
        '/parent_dashboard': (context) => ParentDashboardScreen(),
      },
    );
  }
}
