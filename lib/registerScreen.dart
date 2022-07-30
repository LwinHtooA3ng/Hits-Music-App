import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var isVisible = true;

  final _formKey = GlobalKey<FormState>();

  bool _submitted = false;

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
                      "Register",
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
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Username can\'t be empty';
                        } else if (text.length < 3) {
                          return 'Username too short';
                        } else {
                          return null;
                        }
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
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      cursorColor: Colors.greenAccent,
                      style: const TextStyle(color: Colors.white),
                      obscureText: isVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can't be empty";
                        } else if (value.length < 6) {
                          return "Password need 6 character";
                        } else {
                          return null;
                        }
                      },
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
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text(
                          "Already have an account? Log In",
                          style: TextStyle(
                              fontSize: 10, color: Colors.greenAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.greenAccent[400]),
                            onPressed: () async {
                              FocusScope.of(context).unfocus();

                              setState(() => _submitted = true);
    
                              final usernameValid =
                                  _formKey.currentState!.validate();

                              if(usernameValid){
                                final prefs =
                                    await SharedPreferences.getInstance();

                                await prefs.setString(
                                    'username', usernameController.text);

                                await prefs.setString(
                                    "password", passwordController.text);

                                Navigator.pushReplacementNamed(context, '/login');
                                usernameController.clear();
                                passwordController.clear();
                                setState(() => _submitted = false);
                              }

                            },
                            child: const Text("Register"))),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
