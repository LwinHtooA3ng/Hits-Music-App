import 'package:flutter/material.dart';
import 'package:hits/songScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var isVisible = true;

  List User = [
    {"username": "lwinhtoo", "password": "abc123"}
  ];

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isError = true;
  String? usernameErrorText = null;
  String? passwordErrorText = null;

  void usernameValidator() {
    if (usernameController.text.isEmpty) {
      setState(() {
        usernameErrorText = "Username required";
        isError = true;
      });
    } else {
      setState(() {
        usernameErrorText = null;
        isError = false;
      });
    }
  }

  void passwordValidator() {
    if (passwordController.text.isEmpty) {
      setState(() {
        passwordErrorText = "Password required";
        isError = true;
      });
    } else if (passwordController.text.length < 6) {
      setState(() {
        passwordErrorText = "Password need at least 6 character";
        isError = true;
      });
    } else {
      setState(() {
        passwordErrorText = null;
        isError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: DefaultTextStyle(
            style: TextStyle(color: Colors.grey[100]),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 35),
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Register",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.greenAccent),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: usernameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Username",
                      errorText: usernameErrorText,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.grey[100]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    style: const TextStyle(color: Colors.white),
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      errorText: passwordErrorText,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.grey[100]),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: (isVisible)
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.white,
                              )
                            : const Icon(Icons.visibility_off,
                                color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        "Already have an account? Log In",
                        style:
                            TextStyle(fontSize: 10, color: Colors.greenAccent),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent[400]),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            usernameValidator();
                            passwordValidator();
                            // Navigator.pushNamed(context, '/register');
                            if (!isError) {
                              final prefs =
                                  await SharedPreferences.getInstance();

                              await prefs.setString(
                                  'username', usernameController.text);

                              await prefs.setString(
                                  "password", passwordController.text);

                              Navigator.pushNamed(context, '/login');
                              usernameController.clear();
                              passwordController.clear();
                            }
                          },
                          child: const Text("Register"))),
                ],
              ),
            )),
      ),
    );
  }
}
