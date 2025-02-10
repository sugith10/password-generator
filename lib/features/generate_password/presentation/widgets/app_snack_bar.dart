import 'package:flutter/material.dart';

abstract final class AppSnackBar {
  static void call(BuildContext context) => _call(context);

  static void _call(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Copied successfully...'),
          duration: Duration(seconds: 1),
        ),
      );
}
