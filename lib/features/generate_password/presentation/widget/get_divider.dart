import 'package:flutter/material.dart';
import 'package:password_generator/core/const/constants.dart';

class GetDivider extends StatelessWidget {
  const GetDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
          padding: EdgeInsets.only(bottom: defaultPadding),
          child: Divider(
            color: primaryColor,
            thickness: .5,
          ),
        );
  }
}