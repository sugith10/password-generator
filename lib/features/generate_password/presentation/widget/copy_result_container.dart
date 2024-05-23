import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/constants.dart';
import '../bloc/password_generate_bloc.dart';
import 'info_text.dart';

class CopyResultContainer extends StatefulWidget {
  const CopyResultContainer({super.key});

  @override
  State<CopyResultContainer> createState() => _CopyResultContainerState();
}

class _CopyResultContainerState extends State<CopyResultContainer> {
  bool isCopy = false;
  Color borderColor = Colors.transparent;

  void _onTap(String password) {
    if (password.isNotEmpty) {
      HapticFeedback.mediumImpact();
      Clipboard.setData(
        ClipboardData(text: password),
      );
      setState(() {
        borderColor = const Color.fromRGBO(224, 224, 224, 0.293);
      });
      Timer(
        const Duration(milliseconds: 300),
        () => setState(() {
          borderColor = Colors.transparent;
        }),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Copied successfully...'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<PasswordGenratorBloc, PasswordGenratorState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state.passwordController.text.isNotEmpty)
              const InfoText(text: "Tap to Copy Password"),
            const SizedBox(height: 15),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: primaryColor.withOpacity(0.4),
                ),
                borderRadius: BorderRadius.circular(defaultPadding),
                color: borderColor,
              ),
              child: Stack(
                children: [
                  TextField(
                    maxLines: 1,
                    minLines: 1,
                    controller: state.passwordController,
                    readOnly: true,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: primaryColor,
                        ),
                    decoration: InputDecoration(
                      hintText: 'Password will appear here...',
                      hintStyle:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: width * 0.040,
                                color: secondaryColor,
                              ),
                      border: InputBorder.none,
                    ),
                    onTap: () => _onTap(state.passwordController.text),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () => _onTap(state.passwordController.text),
                      child: Icon(
                        Icons.copy,
                        color: secondaryColor,
                        size: width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
