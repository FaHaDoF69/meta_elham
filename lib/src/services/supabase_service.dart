import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/*
*
* A service class for integrating with Supabase
*
* */
class SupabaseIntegration {
  // Constructor will init the Supabase
  SupabaseIntegration() {
    _initializeSupabase();
  }

  /*
  *
  * Asynchronously initializes Supabase with the URL and anon key
  * and get the values from the .env file
  *
  * */
  Future<void> _initializeSupabase() async {
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'].toString(),
      anonKey: dotenv.env['SUPABASE_ANON_KEY'].toString(),
    );
  }
}
