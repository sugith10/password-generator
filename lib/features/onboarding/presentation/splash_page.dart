import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../generate_password/presentation/widget/header.dart';
import '../../generate_password/presentation/pages/password_generate_page/password_generate_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const PasswordGeneratePage()),
          (route) => false,
        );
      }
    });
  }

  final Future<FirebaseApp> _intialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: _intialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const AppLogo();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                _startTimer();
                return const AppLogo();
              }
              return const AppLogo();
            }),
      ),
    );
  }
}
