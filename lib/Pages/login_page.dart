import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/home_page.dart';
import 'package:flutter_application/Pages/resetpw_page.dart';
import 'package:flutter_application/Pages/signup_page.dart';

@override
LoginPage createState() => LoginPage();

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoinPageState();
}

class _LoinPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  Future<User?> Signin(
      {required String idcontroller, required String pwcontroller}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: idcontroller, password: pwcontroller);
      user = userCredential.user;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return user;
  }

  final idcontroller = TextEditingController();

  final pwcontroller = TextEditingController();

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
            flex: 8,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                color: const Color(0xFF264F44),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Username
                      TextField(
                        controller: idcontroller,
                        obscureText: _isPasswordVisible,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                          hintText: 'Username',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      // Password
                      TextField(
                        controller: pwcontroller,
                        obscureText: _isPasswordVisible,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Sign In Button
                      ElevatedButton(
                        onPressed: () async {
                          await Signin(
                              idcontroller: idcontroller.text,
                              pwcontroller: pwcontroller.text);
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(500, 50),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 18),
                        ),
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
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //SIGN UP LINK
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupPage()));
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
            ),
          ),
        ],
      ),
    );
  }
}
