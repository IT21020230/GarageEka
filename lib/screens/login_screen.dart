import 'package:flutter/material.dart';
import 'package:garage_eka/services/authentication_service.dart';
import 'package:garage_eka/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthenticationService _auth = AuthenticationService();

  void _signIn(BuildContext context) async {
    String? result = await _auth.signIn(
      email: emailController.text,
      password: passwordController.text,
    );

    if (result == "Signed in") {
      // Navigate to Home Screen
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Sign-in failed. Please try again.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _signIn(context), // Use a lambda function to call _signIn
              child: Text('Sign In'),
            ),
            SizedBox(height: 10), // Add some space
            TextButton(
              onPressed: () => _navigateToRegister(context), // Call the navigation function
              child: Text('Create an Account'), // Button text
            ),
          ],
        ),
      ),
    );
  }
}
