import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_bloc.dart';

/*
*
* Extension on BuildContext to provide easy access to AuthBloc's TextEditingController instances.
* This extension allows you to access the controllers directly from the BuildContext,
* making it easier to manage form fields in the UI.
*
* */
extension AuthBlocExtension on BuildContext {
  TextEditingController get firstNameController =>
      read<AuthBloc>().firstNameController;

  TextEditingController get lastNameController =>
      read<AuthBloc>().lastNameController;

  TextEditingController get emailController => read<AuthBloc>().emailController;

  TextEditingController get childrenCountController =>
      read<AuthBloc>().childrenCountController;

  TextEditingController get phoneController => read<AuthBloc>().phoneController;

  TextEditingController get passwordController =>
      read<AuthBloc>().passwordController;

  String get guardian => read<AuthBloc>().guardian;
}
