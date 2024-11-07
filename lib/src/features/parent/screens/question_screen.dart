import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_file_upload_widget.dart';
import '../../../widgets/custom_radio_group_widget.dart';
import '../../../widgets/custom_text_field.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String? _selectedGender;
  String? _selectedDiagnosis;

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // AppBar with its own background image
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo/logo_white.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Child's name field
                      const CustomTextFieldWidget(
                        label: 'الاسم الأول',
                      ),
                      const SizedBox(height: 10),
                      // Date of birth field
                      CustomTextFieldWidget(
                        label: 'تاريخ الميلاد؟',
                      ),
                      const SizedBox(height: 10),
                      // Child's email field
                      CustomTextFieldWidget(
                        label: 'ايميل الطفل؟',
                      ),
                      const SizedBox(height: 10),
                      // Child's gender
                      CustomRadioGroup(
                        labelText: 'جنس الطفل؟',
                        options: ['ذكر', 'أنثى'],
                        selectedOption: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      // Child's sensitivity or needs
                      CustomTextFieldWidget(
                        label:
                            'هل يعاني طفلك من حساسية معينة أو أي احتياجات خاصة تحتاج إلى مراعاة؟',
                      ),
                      const SizedBox(height: 10),
                      // Medical reports
                      CustomRadioGroup(
                        labelText:
                            'هل هناك توصيات طبية أو تقارير ترغب بمشاركتها مع فريق التطبيق؟',
                        options: ['نعم', 'لا'],
                        selectedOption: _selectedDiagnosis,
                        onChanged: (value) {
                          setState(() {
                            _selectedDiagnosis = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      // Upload medical reports (file upload functionality added here)
                      CustomFileUpload(),
                      const SizedBox(height: 10),
                      // Communication preference
                      CustomTextFieldWidget(
                        label: 'كيف يفضل طفلك التواصل؟',
                      ),
                      const SizedBox(height: 10),
                      // Confirmation button
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomButtonWidget(
                          buttonText: "تأكيد",
                          gradientColors: [
                            const Color(0xFF01EBC0),
                            const Color(0xFF0A6273)
                          ],
                          textColor: Colors.white,
                          onPressed: () {
                            // Form submission logic here
                            Navigator.pushReplacementNamed(
                                context, '/nextScreen');
                          },
                        ),
                      ),
                      // Image at the end of the screen
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/background/pattern_puzzle.png',
                    // Ensure it covers the entire width
                    fit: BoxFit.cover,
                    // Full width
                    width: MediaQuery.of(context).size.width,
                    colorBlendMode: BlendMode.srcOver,
                    // Apply color overlay
                    // To apply little transparency
                    color: const Color.fromRGBO(255, 255, 255, 0.1),
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
