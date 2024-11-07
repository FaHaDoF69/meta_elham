import 'package:flutter/material.dart';

import '../../shared/app_bar/app_bar_type.dart';
import '../../shared/app_bar/custom_app_bar_widget.dart';
import '../models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    *
    * TODO remove this dummy data and get the data from the API
    *
    * */
    List<CategoryModel> lessonsContentList = [
      CategoryModel(
          id: '1',
          title: 'التواصل',
          subtitle: 'قريباً',
          imagePath: 'assets/images/1.png'),
      CategoryModel(
          id: '2',
          title: 'فهم اضطراب التوحد',
          subtitle: '3 دروس',
          imagePath: 'assets/images/2.png'),
      CategoryModel(
          id: '3',
          title: 'المهارات الحسية والحركية',
          subtitle: 'قريباً',
          imagePath: 'assets/images/3.png'),
      CategoryModel(
          id: '4',
          title: 'التربية الإيجابية والتشجيع',
          subtitle: 'قريباً',
          imagePath: 'assets/images/4.png'),
      CategoryModel(
          id: '2',
          title: 'فهم اضطراب التوحد',
          subtitle: '3 دروس',
          imagePath: 'assets/images/2.png'),
      CategoryModel(
          id: '3',
          title: 'المهارات الحسية والحركية',
          subtitle: 'قريباً',
          imagePath: 'assets/images/3.png'),
      CategoryModel(
          id: '4',
          title: 'التربية الإيجابية والتشجيع',
          subtitle: 'قريباً',
          imagePath: 'assets/images/4.png'),
      CategoryModel(
          id: '2',
          title: 'فهم اضطراب التوحد',
          subtitle: '3 دروس',
          imagePath: 'assets/images/2.png'),
      CategoryModel(
          id: '3',
          title: 'المهارات الحسية والحركية',
          subtitle: 'قريباً',
          imagePath: 'assets/images/3.png'),
      CategoryModel(
          id: '4',
          title: 'التربية الإيجابية والتشجيع',
          subtitle: 'قريباً',
          imagePath: 'assets/images/4.png'),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background for the entire screen
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
                /*
                *
                * App bar section
                *
                * */
                const CustomAppBarWidget(
                  title: 'افهم طفلك',
                  type: AppBarType.title,
                ),

                // Spacer
                const SizedBox(height: 16),

                /*
                *
                * Main Body Section
                *
                * */
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'الفئات',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to a screen with more categories
                            },
                            child: const Text(
                              'المزيد',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Categories Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: lessonsContentList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigate to the lesson screen using a named route and pass the lesson data as arguments
                              Navigator.pushNamed(
                                context,
                                '/category_show',
                                arguments: lessonsContentList[index],
                              );
                            },
                            child: _buildCategoryCard(
                              imagePath: lessonsContentList[index].imagePath,
                              title: lessonsContentList[index].title,
                              subtitle: lessonsContentList[index].subtitle,
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for each category card
  Widget _buildCategoryCard({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
