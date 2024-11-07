import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // Form controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController guardianController = TextEditingController();
  final TextEditingController childrenCountController = TextEditingController();

  // Guardian selection variable
  String _guardian = '';

  // AuthRepository instance
  final AuthRepository _authRepository = AuthRepository();

  /*
  *
  * AuthBloc constructor
  *
  * */
  AuthBloc() : super(AuthInitial()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<GuardianSelected>(_onGuardianSelected); // Handle Guardian selection
  }

  /*
  *
  * Method: Event handler for GuardianSelected
  *
  * */
  void _onGuardianSelected(GuardianSelected event, Emitter<AuthState> emit) {
    _guardian = event.guardian;
    emit(GuardianSelection(_guardian)); // Emit new state for UI update
  }

  /*
  *
  * Method: Event handler for SignUpSubmitted
  *
  * */
  void _onSignUpSubmitted(
      SignUpSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Call the signUp method from the AuthRepository
      await _authRepository.signUp(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        phone: event.phone,
        password: event.password,
        guardian: _guardian,
        childrenCount: event.childrenCount,
      );
      emit(AuthSuccess());
    } catch (error) {
      emit(AuthFailure(error: error.toString()));
    }
  }

  /*
  *
  * Getter for _guardian
  *
  * */
  String get guardian => _guardian;
}
