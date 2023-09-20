import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/Pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String selectValue = '';
  bool passwordToggle = true;
  String errorMessage = '';
  bool authError = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
                  widthFactor: screenSize.width > 600 ? 0.3 : 0.7,
                  heightFactor: 1,
                  child: Image.asset(
                    'assets/images/NSBMEZ Black.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  color: const Color.fromARGB(230, 121, 196, 120),
                  child: Padding(
                    padding:
                        EdgeInsets.all(screenSize.width > 600 ? 40.0 : 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 15, 60, 36),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: usernameController,
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
                            hintText: 'Student ID',
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: validatePW,
                          obscureText: passwordToggle,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  passwordToggle = !passwordToggle;
                                });
                              },
                              child: Icon(
                                passwordToggle
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
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
                        const SizedBox(height: 25),
                        TextFormField(
                          validator: (value) => value != passwordController.text
                              ? 'Password does not match'
                              : null,
                          controller: cpasswordController,
                          obscureText: passwordToggle,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  passwordToggle = !passwordToggle;
                                });
                              },
                              child: Icon(
                                passwordToggle
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
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
                            hintText: 'Confirm password',
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Text(
                            authError ? errorMessage : '',
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: usernameController.text,
                                  password: passwordController.text,
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );

                                setState(() {
                                  authError = false;
                                  errorMessage = '';
                                });
                              } on FirebaseAuthException catch (e) {
                                String errorMessageText = '';
                                switch (e.code) {
                                  case 'email-already-in-use':
                                    errorMessageText = 'Email already in use';
                                    break;
                                  default:
                                    errorMessageText =
                                        'An error occurred. Please try again.';
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
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                screenSize.width > 600
                                    ? 500
                                    : screenSize.width * 0.8,
                                50),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            // Handle forgot password logic here
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign In',
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
          ],
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'Please enter your student email';
  }
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) {
    return 'Please enter a valid student email';
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

String? validateCPW(String? formCpass) {
  if (formCpass == null || formCpass.isEmpty) {
    return 'Please enter your password.';
  }
  return null;
}
