import 'package:flutter/material.dart';

import '../../../data/models/shared/indicator_data_model.dart';
import '../../../utils/theme/app_colors.dart';
import '../../../widgets/activity_card_widget.dart';
import '../../shared/app_bar/app_bar_type.dart';
import '../../shared/app_bar/custom_app_bar_widget.dart';
import '../../shared/custom_pie_chart/custom_pie_chart.dart';
import '../../shared/custom_pie_chart/indicators_widget.dart';

class ParentDashboardScreen extends StatefulWidget {
  const ParentDashboardScreen({super.key});

  @override
  State<ParentDashboardScreen> createState() => _ParentDashboardScreenState();
}

class _ParentDashboardScreenState extends State<ParentDashboardScreen> {
  // Indicator pie chart data
  int touchedIndex = -1;

  // TODO get data from API here
  final List<IndicatorDataModel> indicators = [
    IndicatorDataModel(color: AppColors.contentColorBlue, text: 'First'),
    IndicatorDataModel(color: AppColors.contentColorYellow, text: 'Second'),
    IndicatorDataModel(color: AppColors.contentColorPurple, text: 'Third'),
    IndicatorDataModel(color: AppColors.contentColorGreen, text: 'Fourth'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(180.0),
      //   child: CustomAppBarWidget(),
      // ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/images/background/bg_green.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background/bg_green.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // CustomAppBarWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /*
                  *
                  * App bar section
                  *
                  * */
                  const CustomAppBarWidget(
                    name: 'Fahad Alharbi',
                    avatarUrl: 'assets/images/avatars/avatar.png',
                    type: AppBarType.user,
                  ),

                  /*
                  *
                  * Main Body Section
                  *
                  * */
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*
                        *
                        * Statistic Children Section
                        *
                        * */
                        const Text(
                          "إحصائيات طفلي",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 28),
                              IndicatorsWidget(indicators: indicators),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: CustomPieChart(
                                      touchedIndex: touchedIndex),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /*
                        *
                        * Last Activities section
                        *
                        * */
                        const SizedBox(height: 20),
                        const Text(
                          "اخر الأنشطة",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const ActivityCardWidget(
                          imageUrl:
                              'https://img.freepik.com/free-vector/coloring-book-worksheet-kids_1308-106640.jpg',
                          title: 'لعبة الألوان',
                          subtitle: '',
                          progress: 1,
                        ),
                        const SizedBox(height: 10),
                        const ActivityCardWidget(
                          imageUrl:
                              'https://img.freepik.com/free-photo/diverse-kids-reading-books_53876-146406.jpg?t=st=1730024993~exp=1730028593~hmac=6c9fc10d76c216a8fd03b3ef3b235f11c00f4742a0710dd45ae7c123579f1ed4&w=1060',
                          title: 'المهارات الحسية والحركية',
                          subtitle: '',
                          progress: 0.75,
                        ),
                        const SizedBox(height: 10),
                        const ActivityCardWidget(
                          imageUrl:
                              'https://img.freepik.com/free-photo/education-study-childhood-skill-word_53876-121550.jpg',
                          title: 'التربية الإيجابية والتشجيع',
                          subtitle: ' تعزيز السلوكيات الإيجابية ',
                          progress: 0.01,
                        ),
                        const SizedBox(height: 10),
                        const ActivityCardWidget(
                          imageUrl:
                              'https://img.freepik.com/free-vector/coloring-book-worksheet-kids_1308-106640.jpg',
                          title: 'لعبة الألوان',
                          subtitle: '',
                          progress: 1,
                        ),
                        const SizedBox(height: 10),
                        const ActivityCardWidget(
                          imageUrl:
                              'https://img.freepik.com/free-photo/diverse-kids-reading-books_53876-146406.jpg?t=st=1730024993~exp=1730028593~hmac=6c9fc10d76c216a8fd03b3ef3b235f11c00f4742a0710dd45ae7c123579f1ed4&w=1060',
                          title: 'المهارات الحسية والحركية',
                          subtitle: '',
                          progress: 0.75,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
