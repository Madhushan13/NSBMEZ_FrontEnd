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
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            flex: 5,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 1,
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
                          'SignUp',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Username
                      TextField(
                        controller: idcontroller,
                        decoration: const InputDecoration(
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
                      TextField(
                        controller: idcontroller,
                        decoration: const InputDecoration(
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
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Password
                      TextField(
                        controller: pwcontroller,
                        obscureText: !isPasswordVisible,
                        decoration: const InputDecoration(
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
                      TextField(
                        controller: idcontroller,
                        obscureText: !isPasswordVisible,
                        decoration: const InputDecoration(
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
                          hintText: 'Confirm password',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            title: const Text("Lecturer"),
                            value: "Lecturer",
                            groupValue: selectValue,
                            onChanged: (value) {
                              setState(() {
                                selectValue = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("Admin"),
                            value: "Admin",
                            groupValue: selectValue,
                            onChanged: (value) {
                              setState(() {
                                selectValue = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("Student"),
                            value: "Student",
                            groupValue: selectValue,
                            onChanged: (value) {
                              setState(() {
                                selectValue = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Handle the sign-up logic here
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(500, 50),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                              // Handle sign-up link logic here
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

void main() {
  runApp(const MaterialApp(
    home: SignupPage(),
  ));
}

  // ignore: non_constant_identifier_names
  /*Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 50),
            _inputField("username", usernameController),
            const SizedBox(height: 10),
            _inputField("email", usernameController),
            const SizedBox(height: 10),
            _inputField("password", passwordController, isPassword: true),
            const SizedBox(height: 10),
            _inputField("conform password", passwordController,
                isPassword: true),
            Column(
              children: [
                RadioListTile(
                    title: const Text("Lecturer"),
                    value: "Lecturer",
                    groupValue: selectValue,
                    onChanged: (value) {
                      setState(() {
                        selectValue = value.toString();
                      });
                    }),
                RadioListTile(
                    title: const Text("Admin"),
                    value: "Admin",
                    groupValue: selectValue,
                    onChanged: (value) {
                      setState(() {
                        selectValue = value.toString();
                      });
                    }),
                RadioListTile(
                    title: const Text("Student"),
                    value: "Student",
                    groupValue: selectValue,
                    onChanged: (value) {
                      setState(() {
                        selectValue = value.toString();
                      });
                    }),
                const SizedBox(height: 10),
                _loginBtn(),
                const SizedBox(height: 20),
                _extraText(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 63, 63, 63), width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.person,
          color: Color.fromARGB(255, 78, 78, 78), size: 120),
    );
  }*/

  /*Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color.fromARGB(255, 24, 24, 24)));
    return TextField(
      style: const TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: usernameController.text,
                password: passwordController.text)
            .then((value) => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()))
                });

        debugPrint("Username : ${usernameController.text}");
        debugPrint("Password : ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 233, 236, 233),
        backgroundColor: const Color.fromARGB(255, 34, 131, 55),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Sign up",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
    );
  }

  Widget _extraText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?"),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Sign in",
            style: TextStyle(color: Color.fromARGB(199, 51, 117, 240)),
          ),
        ),
      ],
    );
  }
}*/
