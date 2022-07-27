import 'package:flutter/material.dart';

class startScreen extends StatelessWidget {
  const startScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.grey[100]),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("images/HeadphoneLogo.png"),
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent[400]),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text("Login"))),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent[400]),
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text("Register"))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
