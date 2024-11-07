import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_elham_flutter/src/features/auth/screens/otp_screen.dart';
import 'package:meta_elham_flutter/src/features/category/screens/category_screen.dart';
import 'package:meta_elham_flutter/src/features/parent/screens/parent_dashboard_screen.dart';

import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/signup_screen.dart';
import 'features/category/screens/category_show_screen.dart';
import 'features/child/screens/child_details_screen.dart';
import 'features/child/screens/child_info_screen.dart';
import 'features/onboarding/screens/onboarding_screen.dart';
import 'features/parent/screens/parent_child_edit_profile_screen.dart';
import 'features/parent/screens/parent_edit_profile_screen.dart';
import 'features/parent/screens/plus_account_screen.dart';
import 'features/parent/screens/profile_screen.dart';
import 'features/parent/screens/question_screen.dart';
import 'features/shared/navigation_bottom_bar/cubit/navigation_cubit.dart';
import 'features/shared/navigation_bottom_bar/screens/parent_navigation_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(create: (context) => NavigationCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meta Elham App',
        // Set the locale to Arabic
        locale: const Locale('ar'),
        // Forces RTL layout
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl, // Force RTL
            child: child!,
          );
        },
        initialRoute: '/',
        routes: {
          // Initial route
          '/': (context) => const LoginScreen(),
          '/onboarding': (context) => OnboardingScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/otp': (context) => const OtpScreen(),

          // Parent screens
          '/parent_nav': (context) => ParentNavigation(),
          '/parent_dashboard': (context) => const ParentDashboardScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/child_details': (context) => const ChildDetailsScreen(),
          '/question': (context) => const QuestionScreen(),
          '/childInfo': (context) => const ChildInfoScreen(),
          '/edit_kids_profile': (context) => const EditKidsProfileScreen(),
          '/edit_parent_profile': (context) => const EditParentProfileScreen(),
          '/plus_account': (context) => const MetaElhamPlusScreen(),

          // Category screens
          '/category': (context) => const CategoryScreen(),
          '/category_show': (context) => const CategoryShowScreen(),
        },
      ),
    );
  }
}
