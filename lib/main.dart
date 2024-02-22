import 'package:flutter/material.dart';
import 'package:password_generator/features/generate_password/presentation/pages/splash_page/splash_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Password Generator',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            fontFamily: 'Poppins',
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        
              titleMedium:  TextStyle(color: Color.fromARGB(255, 7, 255, 44) ),
        
              titleLarge: TextStyle(color: Color.fromARGB(255, 150, 148, 141)),
        
         labelMedium: TextStyle(color: Color.fromARGB(255, 18, 94, 207)),
        
            )
          ),
          home: const SplashPage(),
        );
      }
    );
  }
}
