import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryShowScreen extends StatelessWidget {
  const CategoryShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the lesson details from the arguments
    final lesson = ModalRoute.of(context)!.settings.arguments as CategoryModel;

    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: Center(
        child: Column(
          children: [
            Image.asset(lesson.imagePath),
            const SizedBox(height: 16),
            Text(
              lesson.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(lesson.subtitle),
          ],
        ),
      ),
    );
  }
}
