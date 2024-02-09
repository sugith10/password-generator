import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Center(
      child: GradientText(
        'Password\nGenerator',
  
        style:const TextStyle(fontSize: 50, fontWeight: FontWeight.w900, letterSpacing: 1.5),
        colors: const [
        Color(0xFF2196F3),
        Color(0xFFF06292),
        ],
        gradientType: GradientType.linear,
        radius: 2,
        gradientDirection: GradientDirection.rtl,
      ),
    );
  }
}
