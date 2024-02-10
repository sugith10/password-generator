import 'package:flutter/material.dart';
import 'package:password_generator/features/generate_password/presentation/pages/splash_page/splash_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
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
}
