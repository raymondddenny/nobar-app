import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nobar_app/screens/login_screen.dart';
import 'package:nobar_app/utils/colors.dart';

import 'screens/call_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nobar App',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      routes: {
        '/': (context) => const LoginScreen(),
        '/call': (context) => const CallScreen(),
      },
      initialRoute: '/', // default is '/'
    );
  }
}
