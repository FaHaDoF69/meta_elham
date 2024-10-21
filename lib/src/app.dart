import 'package:flutter/material.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/onboarding/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meta Elham App',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // Initial route
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
