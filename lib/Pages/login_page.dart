import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/home_page.dart';
import 'package:flutter_application/Pages/loading_page.dart';
import 'package:flutter_application/Pages/resetpw_page.dart';
import 'package:flutter_application/Pages/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 1,
                child: Image.asset(
                  'assets/images/usermaleicon-1-497.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Username
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Password
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign In Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const Text('Sign In'),
                  ),

                  const SizedBox(height: 10),

                  // Forgot Password
                  GestureDetector(
                    onTap: () {
                      //FORGOT PW LINK
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPWPage()));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  const Spacer(),

                  //sign UP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //SIGN UP LINK
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
