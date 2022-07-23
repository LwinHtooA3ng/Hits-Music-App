import 'package:flutter/material.dart';
import 'package:hits/songScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isVisible = true;

  List User = [
    {"username": "lwinhtoo", "password": "abc123"}
  ];

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: DefaultTextStyle(
          style: TextStyle(color: Colors.grey[100]),
          child: ListView(
            padding: const EdgeInsets.all(30),
            children: [
              const SizedBox(
                height: 15,
              ),
              const Image(
                image: AssetImage("images/HeadphoneLogo.png"),
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.greenAccent),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: usernameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(color: Colors.grey[100]),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
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
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.grey[100]),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
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
                        : const Icon(Icons.visibility_off, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                  onPressed: () {
                    if (usernameController.text == User[0]['username'] &&
                        passwordController.text == User[0]['password']) {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const HitsStl();
                      // }));

                      Navigator.pushNamed(context, '/song');
                      usernameController.clear();
                      passwordController.clear();
                    } else {
                      var snackBar = const SnackBar(
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                        content: Text('Invalid username or password !'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text("Login")),
            ],
          )),
    );
  }
}
