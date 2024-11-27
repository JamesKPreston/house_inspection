import 'package:flutter/material.dart';
 
import 'package:supabase_flutter/supabase_flutter.dart';
 
import 'screens/login_screen.dart';
 
void main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
 
  await Supabase.initialize(
 
    url: 'https://your-supabase-url.supabase.co',
 
    anonKey: 'your-supabase-anon-key',
 
  );
 
  runApp(MyApp());
 
}
 
class MyApp extends StatelessWidget {
 
  @override
 
  Widget build(BuildContext context) {
 
    return MaterialApp(
 
      title: 'House Inspection App',
 
      home: LoginScreen(),
 
    );
 
  }
 
}