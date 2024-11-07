import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field.dart';

class EditParentProfileScreen extends StatelessWidget {
  const EditParentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background/bg_green.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                // Custom AppBar with a title and back button
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF01EBC0), Color(0xFF0A6273)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Row(
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'تعديل الحساب للأب',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 50),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Profile picture and edit button section
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            'assets/images/avatars/avatar.png'), // Replace with your image path
                      ),
                      const SizedBox(width: 100),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF01EBC0), Color(0xFF0A6273)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              // Edit profile picture logic here
                            },
                            child: const Text(
                              'تغيير',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Parent Information Form Fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      // Parent's Name Field
                      CustomTextFieldWidget(
                        label: 'الاسم',
                      ),
                      const SizedBox(height: 10),

                      // Birth Date Field
                      CustomTextFieldWidget(
                        label: 'تاريخ الميلاد؟',
                      ),
                      const SizedBox(height: 10),

                      // Email Field
                      CustomTextFieldWidget(
                        label: 'الإيميل',
                      ),
                      const SizedBox(height: 10),

                      // Phone Number Field
                      CustomTextFieldWidget(
                        label: 'رقم الجوال',
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),

                // Update Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomButtonWidget(
                    buttonText: "تحديث",
                    gradientColors: const [
                      Color(0xFF01EBC0),
                      Color(0xFF0A6273)
                    ],
                    textColor: Colors.white,
                    onPressed: () {
                      // Handle the update logic here
                    },
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
