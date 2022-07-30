import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isVisible = true;

  bool _submitted = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: DefaultTextStyle(
            style: TextStyle(color: Colors.grey[100]),
            child: Form(
              key: _formKey,
              autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
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
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.greenAccent),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: usernameController,
                      cursorColor: Colors.greenAccent,
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text("username", style: TextStyle(fontSize: 13),),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(color: Colors.grey[100]),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordController,
                      cursorColor: Colors.greenAccent,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password required";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      obscureText: isVisible,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        label: const Text("password", style: TextStyle(fontSize: 13),),
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
                    SizedBox(
                      height: 30,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: const Text(
                          "Don't have an account? Register Here",
                          style: TextStyle(
                              fontSize: 10, color: Colors.greenAccent),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    SizedBox(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent[400]),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();

                            setState(() => _submitted = true);

                            final prefs = await SharedPreferences.getInstance();
                            final String? username =
                                prefs.getString('username');
                            final String? password =
                                prefs.getString('password');

                            final loginValidate =
                                _formKey.currentState!.validate();

                            if (loginValidate) {
                              if (usernameController.text == username &&
                                  passwordController.text == password) {
                                    setState(() => _submitted = false);
                                Navigator.pushReplacementNamed(context, '/song');
                                usernameController.clear();
                                passwordController.clear();
                              } else {
                                if (usernameController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  var snackBar = const SnackBar(
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 1),
                                    content:
                                        Text('Invalid username or password !'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  Container();
                                }
                              }
                            }
                          },
                          child: const Text("Login")),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
