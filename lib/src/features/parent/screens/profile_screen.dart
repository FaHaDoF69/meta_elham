import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../shared/app_bar/app_bar_type.dart';
import '../../shared/app_bar/custom_app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Body background image (for the whole body excluding the AppBar)
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
                * AppBar Section
                *
                * */
                // Container(
                //   height: 200,
                //   decoration: const BoxDecoration(
                //     image: DecorationImage(
                //       image:
                //           AssetImage('assets/images/background/bg_appbar.png'),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 50),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         IconButton(
                //           icon: const Icon(Icons.notifications,
                //               color: Colors.white),
                //           onPressed: () {},
                //         ),
                //         const Text(
                //           'الحساب',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         const SizedBox(width: 50),
                //       ],
                //     ),
                //   ),
                // ),

                /*
                *
                * App bar section
                *
                * */
                const CustomAppBarWidget(
                  title: 'الملف الشخصي',
                  type: AppBarType.title,
                ),

                // Space between the AppBar and the body
                const SizedBox(height: 20),

                /*
                *
                * Profile Info Section
                *
                * */
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/avatars/avatar.png'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'عامر الحربي',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                // Gradient button next to the name
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF01EBC0),
                                        Color(0xFF0A6273)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.white),
                                    onPressed: () {
                                      // Navigate to edit screen or show edit dialog
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '8686652357\nabdulaeim317@gmail.com',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'اشتراك سنوي',
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Subscription Section
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'ميتا إلهام',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'اشترك في ميتا إلهام بلس الآن',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'يحصل الكثير من المدربات لك وطفلك على طلب ودروس حصرية بالإضافة إلى تواصل مع مستشارين متخصصين لمتابعة طفلك على مدار السنة',
                        style: TextStyle(color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.teal, Colors.blue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CustomButtonWidget(
                          buttonText: "اشترك الان",
                          gradientColors: const [
                            Color(0xFF01EBC0),
                            Color(0xFF0A6273)
                          ],
                          textColor: Colors.white,
                          onPressed: () {
                            // Navigate to otp screen
                            Navigator.pushReplacementNamed(context, '/otp');
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Options List
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildOptionItem('إدارة التابعين', Icons.people),
                    _buildOptionItem(
                        'إدارة المحفظة', Icons.account_balance_wallet),
                    _buildOptionItem('سياسات الخصوصية', Icons.privacy_tip),
                    _buildOptionItem('نبذة عن التطبيق', Icons.info),
                    _buildOptionItem('تسجيل الخروج', Icons.exit_to_app),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        leading: Container(
          padding: const EdgeInsets.all(5), // Outer padding
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF04A397), // Green shadow color
                blurRadius: 8, // Spread of the shadow
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(5), // Inner padding
            decoration: BoxDecoration(
              color: const Color(0xFF04A397),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.black),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          // Handle the tap
        },
      ),
    );
  }
}
