import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/login_page.dart';

class ResetPWPage extends StatefulWidget {
  const ResetPWPage({super.key});

  @override
  State<ResetPWPage> createState() => _ResetPWPageState();
}

class _ResetPWPageState extends State<ResetPWPage> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Container(
                  color: const Color.fromARGB(230, 121, 196, 120),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 15, 60, 36),
                            ),
                          ),
                        ),
                        // Username
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
                                )),
                            fillColor: Color(0xFFBAD3C8),
                            filled: true,
                            hintText: 'Student Email',
                          ),
                        ),

                        const SizedBox(
                          height: 25,
                        ),
                        // Password

                        Center(
                          child: Text(
                            authError ? errorMessage : '',
                            style: const TextStyle(
                                color: Colors
                                    .red), // You can style the error message text here
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => (),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(500, 50),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 45.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
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
