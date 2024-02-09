import 'dart:async';

import 'package:flutter/material.dart';
import 'package:password_generator/features/generate_password/presentation/pages/password_generate_page/password_generate_page.dart';
import 'package:password_generator/features/generate_password/presentation/widget/header.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
      Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>const PasswordGeneratePage()), (route) => false);
     });
    return const Scaffold(
      body: Center(
        child: Header(),
      )
    );
  }
}