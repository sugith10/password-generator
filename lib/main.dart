import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'features/onboarding/presentation/loading_page.dart';
import 'features/onboarding/presentation/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _intialization = Firebase.initializeApp(
    options: firebaseOptions,
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _intialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          log('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Password Generator',
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.black,
                fontFamily: 'Poppins',
                textTheme: const TextTheme(
                  bodyMedium:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  titleLarge:
                      TextStyle(color: Color.fromARGB(255, 150, 148, 141)),
                )),
            home: const SplashPage(),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
          ),
          home: const LoadingPage(),
        );
      },
    );
  }
}
