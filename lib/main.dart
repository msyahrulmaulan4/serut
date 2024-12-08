import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:serut/features/auth/lupapassword.dart';
import 'package:serut/features/home/bantuan.dart';
import 'package:serut/features/home/cekstatus.dart';
import 'package:serut/features/home/profile.dart';
import 'package:serut/features/home/submissionform.dart';
import 'features/auth/loginpage.dart';
import 'features/auth/registerpage.dart';
import 'features/home/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase here
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SERUT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomeScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/pengajuan': (context) => const SubmissionForm(),
        '/cek-status': (context) => const CekStatusScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/bantuan': (context) => const BantuanScreen(),
      },
    );
  }
}
