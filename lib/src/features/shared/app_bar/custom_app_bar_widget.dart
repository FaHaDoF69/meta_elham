// lib/src/widgets/custom_app_bar_widget.dart
import 'package:flutter/material.dart';

import 'app_bar_type.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String? name;
  final String? avatarUrl;
  final String? title;
  final AppBarType type;

  const CustomAppBarWidget({
    super.key,
    this.name,
    this.avatarUrl,
    this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF01EBC0), Color(0xFF0A6273)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (type == AppBarType.user) ...[
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(avatarUrl!),
            ),
            const SizedBox(width: 20),
            Text(
              name!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: Stack(
                children: [
                  const Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.white,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ] else if (type == AppBarType.title && title != null) ...[
            Expanded(
              child: Center(
                child: Text(
                  title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
