import 'package:flutter/material.dart';
import 'gradient_circular_indicator_widget.dart';

class ActivityCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double progress; // Value between 0 and 1

  const ActivityCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              imageUrl,
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10.0),

          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Progress Indicator Section
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                // child: CircularProgressIndicator(
                //   value: progress,
                //   strokeWidth: 4.0,
                //   color: Colors.purple,
                //   backgroundColor: Colors.purple.shade100,
                // ),
                child: GradientCircularProgressIndicator(
                  progress: progress,
                ),
              ),
              Text(
                "${(progress * 100).round()}%",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
