import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/const/constants.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });
  final String label;
  final bool value;
  final VoidCallback onChanged;

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
            color: cardColor2,
            border: Border.all(
              color: value
                  ? primaryColor.withValues(
                      alpha: 0.5,
                    )
                  : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(defaultPadding),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Color.fromARGB(255, 251, 251, 251),
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
