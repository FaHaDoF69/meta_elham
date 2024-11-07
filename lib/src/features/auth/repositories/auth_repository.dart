import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  // Get the Supabase client
  final supabase = Supabase.instance.client;

  /*
  *
  * Sign up a new user using Supabase Auth with throw Exception statements
  *
  * TODO replace logs after successful sign up with
  * */
  Future<AuthResponse> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String guardian,
    required int childrenCount,
    required String phone,
    required String password,
  }) async {
    try {
      // Sign up with email to send an email verification OTP
      // await supabase.auth.signInWithOtp(email: email);
      /// first_name VARCHAR(100) NOT NULL,
      //     last_name VARCHAR(100) NOT NULL,
      //     email VARCHAR(255) UNIQUE NOT NULL,
      //     role user_role : 'parent', 'educator', 'child', 'admin'

      return await supabase.auth
          .signUp(email: email, password: password, data: {
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'guardian': guardian,
        'children_count': childrenCount ?? 1,
        'user_role': 'parent'
      });
    } on AuthException catch (e) {
      // Handle Supabase Auth-related exceptions
      log('AuthException error during sign up: ${e.message}');
      throw Exception('AuthException error during sign up: ${e.message}');
    } on PostgrestException catch (e) {
      // Handle Supabase PostgREST API-related exceptions
      log('PostgrestException error during sign up: ${e.message}');
      throw Exception('PostgrestException error during sign up: ${e.message}');
    } catch (e) {
      // Handle any other exceptions
      log('Error during sign up: $e');
      throw Exception('Error during sign up: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      // Handle the error appropriately
      throw Exception('Error signing out: $e');
    }
  }
}
