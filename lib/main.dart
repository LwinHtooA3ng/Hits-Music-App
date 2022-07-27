import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'songScreen.dart';
import 'startScreen.dart';
import 'registerScreen.dart';

void main() => runApp(const MusicApp());

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Main",
      initialRoute: '/',
      routes: {
        '/': (context) => const startScreen(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/song': (context) => const HitsStf()
      },
    );
  }
}
