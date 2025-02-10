import 'dart:async';

import 'package:flutter/material.dart';

import '../../generate_password/presentation/page/password_generate_page.dart';
import '../../generate_password/presentation/widgets/header.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<dynamic>(
            builder: (_) => const PasswordGeneratePage(),
          ),
          //
          // ignore: always_specify_types
          (Route route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppLogo(),
      ),
    );
  }
}
