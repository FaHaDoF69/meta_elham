import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';

class MetaElhamPlusScreen extends StatelessWidget {
  const MetaElhamPlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image for the whole body excluding the AppBar
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar with its background image and back button
                Container(
                  height: 200,
                  padding: const EdgeInsets.only(left: 16, top: 40),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/background/bg_appbar.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'حساب ميتا إلهام بلس',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Subscription options
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'اشترك في ميتا إلهام بلس الآن',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSubscriptionCard(
                            title: 'اشتراك سنة',
                            price: '450 ريال / الشهر',
                            totalPrice: 'الإجمالي 5400 ريال لمدة سنة',
                          ),
                          const SizedBox(width: 16),
                          _buildSubscriptionCard(
                            title: 'اشتراك شهر',
                            price: '550 ريال / الشهر',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Subscription benefits
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'مميزات الإشتراك',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      //TODO change icons
                      const SizedBox(height: 16),
                      _buildFeatureItem('محتوى تعليمي متقدم',
                          'الوصول إلى أنشطة تعليمية متقدمة وفيديوهات تعليمية موجهة.'),
                      _buildFeatureItem('تقارير مفصلة',
                          'تقارير دورية حول تقدم الطفل وتوصيات لتحسين الأداء.'),
                      _buildFeatureItem('استشارة ودعم مخصص',
                          'استشارات مع متخصصين موثوقين في الدعم النفسي.'),
                      _buildFeatureItem('الذكاء الاصطناعي',
                          'مقترحات تشخيصية وسلوكية باستخدام الذكاء الاصطناعي.'),
                      _buildFeatureItem('إشعارات فورية',
                          'تنبيهات فورية لتقييم الطفل وأنشطة جديدة.'),
                      _buildFeatureItem('فتح المحتوى بالكامل',
                          'الوصول غير المحدود لكل الأنشطة والمحتوى.'),
                      _buildFeatureItem('إضافة أكثر من طفل',
                          'إمكانية إدارة ملفات شخصية لأكثر من طفل.'),
                      _buildFeatureItem('خصومات حصرية',
                          'عروض وخصومات على خدمات واستشارات إضافية.'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Subscription button
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: CustomButtonWidget(
                      buttonText: "الدفع",
                      gradientColors: const [
                        Color(0xFF01EBC0),
                        Color(0xFF0A6273)
                      ],
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/otp');
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for the subscription cards
  Widget _buildSubscriptionCard(
      {required String title, required String price, String? totalPrice}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: 150,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          if (totalPrice != null) ...[
            const SizedBox(height: 8),
            Text(
              totalPrice,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  // Helper widget for each feature item
  Widget _buildFeatureItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.teal, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
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
