import 'package:flutter/material.dart';
 
import 'package:supabase_flutter/supabase_flutter.dart';
 
import 'home_screen.dart';
 
class LoginScreen extends StatefulWidget {
 
  @override
 
  _LoginScreenState createState() => _LoginScreenState();
 
}
 
class _LoginScreenState extends State<LoginScreen> {
 
  final emailController = TextEditingController();
 
  final passwordController = TextEditingController();
 
  void login() async {
 
    final response = await Supabase.instance.client.auth.signIn(
 
      email: emailController.text,
 
      password: passwordController.text,
 
    );
 
    if (response.error == null) {
 
      Navigator.pushReplacement(
 
        context,
 
        MaterialPageRoute(builder: (context) => HomeScreen()),
 
      );
 
    } else {
 
      ScaffoldMessenger.of(context)
 
          .showSnackBar(SnackBar(content: Text(response.error!.message)));
 
    }
 
  }
 
  @override
 
  Widget build(BuildContext context) {
 
    return Scaffold(
 
      appBar: AppBar(title: Text('Login')),
 
      body: Padding(
 
        padding: EdgeInsets.all(16.0),
 
        child: Column(
 
          children: [
 
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
 
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password')),
 
            SizedBox(height: 20),
 
            ElevatedButton(onPressed: login, child: Text('Login')),
 
          ],
 
        ),
 
      ),
 
    );
 
  }
 
}
