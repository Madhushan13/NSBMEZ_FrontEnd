import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/home_page.dart';
import 'package:flutter_application/Pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  bool passwordToggle = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String errorMessage = '';

  bool authError = false;

  Future<void> signInWithEmailPassword() async {
    if (_formKey.currentState!.validate()) {
      FirebaseAuth auth = FirebaseAuth.instance;
      try {
        await auth.signInWithEmailAndPassword(
          email: idController.text,
          password: pwController.text,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        setState(() {
          authError = false;
        });
      } on FirebaseAuthException catch (e) {
        String errorMessageText = '';
        switch (e.code) {
          case 'wrong-password':
            errorMessageText = 'Invalid Password.';
            break;
          case 'user-not-found':
            errorMessageText = 'Invalid Username';
            break;
          default:
            errorMessageText = 'An error occurred. Please try again.';
        }
        setState(() {
          authError = true;
          errorMessage = errorMessageText;
        });
      }
    } else {
      setState(() {
        authError = false;
        errorMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive padding based on screen size
    final EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.05,
      vertical: screenHeight * 0.02,
    );

    // Define responsive font size
    final double fontSize = screenWidth > 600 ? 30.0 : 18.0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  heightFactor: 1,
                  child: Image.asset(
                    'assets/images/NSBMEZ Black.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  color: const Color.fromARGB(230, 121, 196, 120),
                  child: Padding(
                    padding: contentPadding, // Use responsive padding
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: fontSize * 1.5,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 15, 60, 36),
                              ),
                            ),
                          ),
                          // Username/Email TextField
                          TextFormField(
                            controller: idController,
                            validator: validateEmail,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Color(0xFFBAD3C8),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              fillColor: Color(0xFFBAD3C8),
                              filled: true,
                              hintText: 'Student Mail',
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          // Password TextField
                          TextFormField(
                            controller: pwController,
                            obscureText: passwordToggle,
                            validator: validatePW,
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    passwordToggle = !passwordToggle;
                                  });
                                },
                                child: Icon(passwordToggle
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Color(0xFFBAD3C8),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              fillColor: const Color(0xFFBAD3C8),
                              filled: true,
                              hintText: 'Password',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              authError ? errorMessage : '',
                              style: const TextStyle(
                                  color: Colors
                                      .red), // You can style the error message text here
                            ),
                          ),

                          // Sign In Button
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ElevatedButton(
                              onPressed: signInWithEmailPassword,
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(screenWidth * 0.9, 50),
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Sign In',
                                style: TextStyle(fontSize: fontSize),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Forgot Password

                          // Sign Up
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account? ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // SIGN UP LINK
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupPage(),
                                      ),
                                    );
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'Please enter your email.';
  }
  String pattern = r'^[\w-\.]+@students\.nsbm\.ac\.lk$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) {
    return 'Please enter a valid NSBM email.';
  }
  return null;
}

String? validatePW(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Please enter your password.';
  }
  if (formPassword.length < 6) {
    return 'Password must be at least 6 characters.';
  }
  return null;
}
