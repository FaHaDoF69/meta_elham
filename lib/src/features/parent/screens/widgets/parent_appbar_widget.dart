import 'package:flutter/material.dart';

class ParentAppBarWidget extends StatelessWidget {
  final String name;
  final String avatarUrl;

  const ParentAppBarWidget({
    super.key,
    required this.name,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        // TODO colors

        // Get the colors from theme
        image: DecorationImage(
          image: AssetImage('assets/images/background/bg_green_dark.png'),
          // Replace with your image path
          fit: BoxFit.fitWidth, // Ensures the image covers the entire AppBar
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*
          *
          * Name and Avatar
          *
          * */
          // User avatar
          CircleAvatar(
            radius: 25,
            // TODO make it nested if avatar is not local
            // backgroundImage: NetworkImage(avatarUrl), // Use the provided avatar URL
            backgroundImage:
                AssetImage(avatarUrl), // Use the provided avatar URL
          ),

          // Spacer
          const SizedBox(
            width: 20,
          ),

          // User name
          Text(
            name, // Use the provided name
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Spacer
          const Spacer(),

          /*
          *
          * Menu Icon
          *
          * */
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
                      '1', // This is the notification badge number
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              // Handle notification click
              Navigator.pushNamed(context, '/PieChartSample2');
            },
          ),
        ],
      ),
    );
  }
}
