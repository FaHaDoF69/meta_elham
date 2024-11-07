import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: GNav(
        gap: 8,
        activeColor: Colors.white,
        iconSize: 26,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: Colors.tealAccent,
        color: Colors.white60,
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.menu_book, text: 'Lessons'),
          GButton(icon: Icons.person, text: 'Consultant'),
          GButton(icon: Icons.person_outline, text: 'Profile'),
        ],
      ),
    );
  }
}
