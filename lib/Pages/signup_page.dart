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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add form key

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double fontSize = screenWidth > 600 ? 30.0 : 18.0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              flex: 2,
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
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                fontSize: fontSize * 1.5,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 15, 60, 36),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: usernameController,
                            validator: validateEmail,
                            decoration: InputDecoration(
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
                          SizedBox(
                            height: screenHeight * 0.02,
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
                                child: Icon(passwordToggle
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
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
                              hintText: 'Password',
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          TextFormField(
                            validator: ((value) =>
                                value != passwordController.text
                                    ? 'Password does not match'
                                    : null),
                            controller: cpasswordController,
                            obscureText: passwordToggle,
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
                              hintText: 'Confirm password',
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Center(
                            child: Text(
                              authError ? errorMessage : '',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: fontSize * 0.6,
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
                                screenWidth * 0.9,
                                screenHeight * 0.06,
                              ),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: fontSize,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: screenHeight * 0.07,
                              top: screenHeight * 0.02,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSize,
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
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: fontSize,
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
