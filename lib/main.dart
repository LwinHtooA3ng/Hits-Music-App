import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'songScreen.dart';

void main() => runApp(const MusicApp());

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Main",
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/song': (context) => const HitsStf()
      },
    );
  }
}