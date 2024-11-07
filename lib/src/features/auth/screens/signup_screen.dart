import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_elham_flutter/src/features/auth/bloc/auth_bloc_extension.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_text_field.dart';
import '../bloc/auth_bloc.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // GlobalKey for the form to identify and manage the state of the form.
  final _formKey = GlobalKey<FormState>();

  /*
  *
  * TODO move this function to a separate file and make it check the length of the input and text type
  * Validation function for the text fields
  *
  * */
  String? validateInput(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال $fieldName';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*
          *
          * Background Image
          *
          */
          Positioned.fill(
            child: Image.asset(
              'assets/images/background/bg_green.png',
              fit: BoxFit.cover, // Make sure the image covers the entire screen
            ),
          ),

          /*
          *
          * Form
          *
          */
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50), // Top padding
                // Meta Elham Logo
                Image.asset(
                  'assets/images/logo/logo_white.png',
                  height: 150,
                ),
                const SizedBox(height: 20),

                /*
                 * Page title
                 */
                const Text(
                  "تسجيل حساب جديد",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                /*
                *
                * Form Fields Section
                *
                */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First name field
                        CustomTextFieldWidget(
                          label: 'الاسم الأول',
                          inputType: TextInputType.name,
                          controller: context.firstNameController,
                          validator: (value) =>
                              validateInput(value, 'الاسم الأول'),
                        ),

                        const SizedBox(height: 10),

                        // Last name field
                        CustomTextFieldWidget(
                          label: "الاسم الأخير",
                          controller: context.lastNameController,
                          validator: (value) =>
                              validateInput(value, 'الاسم الأخير'),
                        ),

                        const SizedBox(height: 10),

                        // Guardian type
                        const Text("ولي الأمر:",
                            style: TextStyle(fontSize: 16)),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final guardian = context
                                .watch<AuthBloc>()
                                .guardian; // Access the current guardian selection

                            return Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: const Text('الأب'),
                                    leading: Radio<String>(
                                      value: 'father',
                                      groupValue: guardian,
                                      // Use the updated guardian value here
                                      onChanged: (value) {
                                        print('father');
                                        context.read<AuthBloc>().add(
                                            GuardianSelected(
                                                value!)); // Dispatch the event
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: const Text('الأم'),
                                    leading: Radio<String>(
                                      value: 'mother',
                                      groupValue: guardian,
                                      // Use the updated guardian value here
                                      onChanged: (value) {
                                        print('mother');
                                        context.read<AuthBloc>().add(
                                            GuardianSelected(
                                                value!)); // Dispatch the event
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),

                        const SizedBox(height: 10),

                        // Children count
                        CustomTextFieldWidget(
                          label: "عدد التابعين",
                          controller: context.childrenCountController,
                          validator: (value) =>
                              validateInput(value, 'عدد التابعين'),
                        ),

                        const SizedBox(height: 10),

                        // Phone number field
                        CustomTextFieldWidget(
                          label: "رقم الجوال",
                          inputType: TextInputType.phone,
                          controller: context.phoneController,
                          validator: (value) =>
                              validateInput(value, 'رقم الجوال'),
                        ),

                        const SizedBox(height: 10),

                        // Email field
                        CustomTextFieldWidget(
                          label: "البريد الإلكتروني",
                          inputType: TextInputType.emailAddress,
                          controller: context.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء إدخال البريد الإلكتروني';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'الرجاء إدخال بريد إلكتروني صحيح';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        // Password field
                        CustomTextFieldWidget(
                          label: "الرقم السري",
                          obscureText: true,
                          controller: context.passwordController,
                          validator: (value) =>
                              validateInput(value, 'الرقم السري'),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text.rich(
                    TextSpan(
                      text: "بالتسجيل فأنا أوافق على سياسات منصة ",
                      children: [
                        TextSpan(
                          text: "ميتا إلهام التعليمية",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /*
                *
                * Submit Button
                *
                */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Sign up successful!')),
                        );
                      } else if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Sign up failed: ${state.error}')),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return CircularProgressIndicator();
                      }
                      return CustomButtonWidget(
                        buttonText: "تسجيل حساب جديد",
                        gradientColors: const [
                          Color(0xFF6FE6A5),
                          Color(0xFF277591)
                        ],
                        textColor: Colors.white,
                        onPressed: () {
                          bool isValid =
                              _formKey.currentState?.validate() ?? false;
                          if (isValid) {
                            BlocProvider.of<AuthBloc>(context).add(
                              SignUpSubmitted(
                                firstName: context.firstNameController.text,
                                lastName: context.lastNameController.text,
                                email: context.emailController.text,
                                phone: context.phoneController.text,
                                password: context.passwordController.text,
                                childrenCount: int.parse(
                                    context.childrenCountController.text),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Please fill in all fields correctly')),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),

                Image.asset(
                  'assets/images/background/pattern_puzzle.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
