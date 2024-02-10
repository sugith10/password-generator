import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/const/constants.dart';
import 'package:password_generator/features/generate_password/presentation/bloc/password_generate_bloc.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:animate_do/animate_do.dart';

class PasswordButton extends StatelessWidget {
  const PasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Tap this generate password button for password generation",
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.642),
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        GestureDetector(
            onTap: () => context
                .read<PasswordGenratorBloc>()
                .add(GeneratePasswordSubmittedEvent()),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black,
                      offset: Offset(5, 5),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                    BoxShadow(
                        color: Colors.grey.shade800,
                        offset: const Offset(-2, -2),
                        blurRadius: 15,
                        spreadRadius: 1)
                  ]),
              child: FadeIn(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 1000),
                child: GradientText(
                  'GENERATE PASSWORD',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                  colors: const [
                    Color(0xFF2196F3),
                    Color(0xFFF06292),
                  ],
                  gradientType: GradientType.linear,
                  radius: 2,
                  gradientDirection: GradientDirection.rtl,
                ),
              ),
            )),
      ],
    );
  }
}
