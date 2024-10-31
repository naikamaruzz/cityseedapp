import 'package:cityseedapp/signup.dart';
import 'package:flutter/material.dart';
import 'profilepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2B28), // Dark background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              Text(
                'CITYSEED',
                style: TextStyle(
                  color: Color(0xFFB1D394), // Light green color
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),

              // Username Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'USERNAME',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                ),
              ),
              SizedBox(height: 10.0),

              // Forgot Password
              TextButton(
                onPressed: () {
                  // Add your forgot password functionality here
                },
                child: Text(
                  'Forget password?',
                  style: TextStyle(
                    color: Color(0xFFB1D394), // Light green color
                  ),
                ),
              ),

              SizedBox(height: 10.0),

              // Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to SignUp on login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFFB1D394), // Light green color
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.0),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to ProfilePage on login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFFB1D394), // Light green button color
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
