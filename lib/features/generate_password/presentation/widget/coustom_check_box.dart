import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/const/constants.dart';

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
        onTap: () {
          onChanged();
          HapticFeedback.lightImpact();
        },
        child: Container(
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
          child: Row(
            children: [
              const SizedBox(width: defaultPadding / 2),
              Icon(
                value ? Icons.check_box : Icons.check_box_outline_blank,
                size: Theme.of(context).textTheme.titleLarge!.fontSize,
                color: Colors.white,
              ),
              const SizedBox(width: defaultPadding / 2),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 251, 251, 251),
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
