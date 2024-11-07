import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta_elham_flutter/src/services/supabase_service.dart';

import 'src/app.dart';

void main() async {
  // Make sure Flutter app is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from .env
  await dotenv.load(fileName: ".env");
  
  // Initialize Supabase
  SupabaseIntegration();

  // Set up the app
  runApp(const App());
}
