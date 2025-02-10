import 'package:flutter/material.dart';
import '../../generate_password/presentation/widgets/header.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AppLogo(),
      ),
    );
  }
}
