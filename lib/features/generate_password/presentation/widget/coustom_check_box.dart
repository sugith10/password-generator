
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
                  fontSize:Theme.of(context).textTheme.titleSmall!.fontSize,
                  color: const Color.fromARGB(255, 251, 251, 251),
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



