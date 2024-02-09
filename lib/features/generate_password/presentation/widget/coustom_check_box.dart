

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:password_generator/core/const/constants.dart';

class CustomCheckBox extends StatelessWidget {
  final String label;
  final bool value;
  final VoidCallback onChanged;
  const CustomCheckBox(
      {super.key,
      required this.label,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(
        defaultPadding / 4,
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultPadding),
        ),
        onTap: onChanged,
        child: Container(

          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: primaryColor.withOpacity(
                0.25,
              ),
            ),
            borderRadius: BorderRadius.circular(defaultPadding),
          ),
          child: Wrap(
            children: [
              const SizedBox(width: defaultPadding / 2),
              Icon(
                value ? Icons.check_box : Icons.check_box_outline_blank,
                size:  Theme.of(context).textTheme.titleLarge!.fontSize,
                color: Colors.white,
              ),
              const SizedBox(width: defaultPadding / 2),
              Text(
                label,
                style:  TextStyle(
                  fontSize:_calculateDescriptionFontSize(screenHeight: height, screenWidth: width),
                  color: Color.fromARGB(255, 251, 251, 251),
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


double _calculateDescriptionFontSize( {required double screenHeight, required double screenWidth}) {
  
    double fontSize;
    if (screenHeight >= 700 &&
        screenHeight < 750 &&
        screenWidth >= 320 &&
        screenWidth < 400) {
          log('$screenHeight $screenWidth 15');
      fontSize = 12.0;
    } else if (screenHeight >= 750 &&
        screenHeight < 780 &&
        screenWidth >= 320 &&
        screenWidth < 410) {
          log('$screenHeight $screenWidth 16');
      fontSize = 12.0;
    } else if (screenHeight >= 780 &&
        screenHeight < 800 &&
        screenWidth >= 400 &&
        screenWidth < 450) {
          log('$screenHeight $screenWidth 17');
      fontSize = 12.0;
    } else if (screenHeight >= 800 &&
        screenHeight < 820 &&
        screenWidth >= 400 &&
        screenWidth < 480) {
          log('$screenHeight $screenWidth 17.5');
      fontSize = 12.5;
    } else if (screenHeight >= 820 &&
        screenHeight < 850 &&
        screenWidth >= 380 &&
        screenWidth < 400) {
          log('$screenHeight $screenWidth 18');
      // log('SM A53');
      fontSize = 12.0;
    } else if (screenHeight >= 850 &&
        screenHeight < 900 &&
        screenWidth >= 410 &&
        screenWidth < 480) {
          log('$screenHeight $screenWidth 18');
      // log('SM M21');
      fontSize = 12.0;
    } else if (screenHeight >= 900 && screenWidth >= 390) {
      fontSize = 25.0;
      log('$screenHeight $screenWidth 22');
    } else {
      fontSize = 15.0;
      log('$screenHeight $screenWidth 21');
    }

    fontSize * 0.01;

    return fontSize;
  }
