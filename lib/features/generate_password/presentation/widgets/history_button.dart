import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../core/const/constants.dart';
import '../bloc/password_generate_bloc.dart';
import 'show_saved_passwords.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Tooltip(
        margin: const EdgeInsets.only(top: 10),
        message: 'Password History',
        child: InkWell(
          onTap: () {
            context.read<PasswordGenratorBloc>().add(GetPasswordHistoryEvent());
            ShowSavedPasswords.call(
              context: context,
              bloc: context.read<PasswordGenratorBloc>(),
            );
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: primaryColor.withValues(
                  alpha: 0.25,
                ),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.all(defaultPadding),
            child: Icon(
              IconlyLight.document,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ),
      ),
    );
  }
}
