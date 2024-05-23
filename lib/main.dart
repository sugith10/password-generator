import 'package:flutter/material.dart';

import 'core/const/constants.dart';
import 'features/onboarding/presentation/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Generator',
      theme: ThemeData(
          scaffoldBackgroundColor: scaffoldColor,
          fontFamily: 'Poppins',
          textTheme: TextTheme(
            bodyMedium: const TextStyle(color: primaryColor),
            titleLarge:
                TextStyle(color: secondaryColor, fontSize: width * 0.050),
          ),
          snackBarTheme: const SnackBarThemeData(backgroundColor: buttonColor)),
      home: const SplashPage(),
    );
  }
}
