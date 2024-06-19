import 'package:flutter/material.dart';

import '../../../../core/const/constants.dart';

class GetDivider extends StatelessWidget {
  const GetDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: primaryColor,
      thickness: .5,
      indent: 50,
      endIndent: 50,
    );
  }
}
