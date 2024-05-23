import 'package:flutter/material.dart';

import '../../../../core/const/constants.dart';

class InfoText extends StatelessWidget {
  final String text;
  const InfoText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: secondaryColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
