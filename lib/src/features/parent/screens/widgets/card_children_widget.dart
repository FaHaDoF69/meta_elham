import 'package:flutter/material.dart';

Widget buildChildProfile(String imagePath, String name, String level) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xFF0A6273),
          Color(0xFF01EBC0),
        ], // Gradient colors
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        // Transparent color for inner container
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios, color: Colors.white),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                level,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 25,
          ),
        ],
      ),
    ),
  );
}
