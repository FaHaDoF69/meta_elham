part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUpSubmitted extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final int childrenCount;

  SignUpSubmitted({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.childrenCount,
  });
}

// Guardian selected event
class GuardianSelected extends AuthEvent {
  final String guardian;

  GuardianSelected(this.guardian);
}
