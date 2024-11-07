import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/costume_bottom_nav_bar.dart';
import '../../../category/screens/category_screen.dart';
import '../../../child/screens/child_details_screen.dart';
import '../../../parent/screens/parent_dashboard_screen.dart';
import '../../../parent/screens/profile_screen.dart';
import '../cubit/navigation_cubit.dart';

class ParentNavigation extends StatelessWidget {
  ParentNavigation({super.key});

  final List<Widget> _screens = [
    const ParentDashboardScreen(),
    const CategoryScreen(),
    const ChildDetailsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state is NavigationTabChanged) {
            return _screens[state.selectedIndex];
          }
          return _screens[0]; // Default to the first screen
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          int selectedIndex = 0;
          if (state is NavigationTabChanged) {
            selectedIndex = state.selectedIndex;
          }
          return CustomBottomNavBar(
            selectedIndex: selectedIndex,
            onTabChange: (index) =>
                context.read<NavigationCubit>().changeTab(index),
          );
        },
      ),
    );
  }
}
