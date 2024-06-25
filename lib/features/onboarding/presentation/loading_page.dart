import 'package:flutter/material.dart';
import 'package:password_generator/features/generate_password/presentation/widget/header.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:AppLogo(),
      ),
    );
  }
}
