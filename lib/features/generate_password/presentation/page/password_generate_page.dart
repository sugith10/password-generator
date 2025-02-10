import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/password_gnerator.dart';
import '../../data/local/save_password.dart';
import '../../data/repositories/password_repo_impl.dart';
import '../../domain/use_cases/delete_password_use_case.dart';
import '../../domain/use_cases/get_password_history_use_case.dart';
import '../../domain/use_cases/pasword_use_case.dart';
import '../../domain/use_cases/save_password_use_case.dart';
import '../bloc/password_generate_bloc.dart';
import '../widgets/get_divider.dart';
import '../widgets/header.dart';
import '../widgets/history_button.dart';
import '../widgets/password_button.dart';
import '../widgets/password_length.dart';
import '../widgets/password_settingfield.dart';

class PasswordGeneratePage extends StatelessWidget {
  const PasswordGeneratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordGenratorBloc>(
      create: (BuildContext context) {
        final PasswordRepoImpl passwordRepo = PasswordRepoImpl(
          passwordGenerator: PasswordGenerator(),
          passwordHistoryLocal: PasswordHistoryLocal(),
        );
        return PasswordGenratorBloc(
          generatePasswordUseCase: GeneratePasswordUseCase(passwordRepo),
          deletePasswordHistoryUseCase:
              DeletePasswordHistoryUseCase(passwordRepo),
          getPasswordHistoryUseCase: GetPasswordHistoryUseCase(passwordRepo),
          savePasswordUseCase: SavePasswordUseCase(passwordRepo),
        );
      },
      child: const _PassWordGeneratePage(),
    );
  }
}

class _PassWordGeneratePage extends StatelessWidget {
  const _PassWordGeneratePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (kIsWeb) AppLogo(),
                    HistoryButton(),
                    PasswordLength(),
                    SizedBox(height: 10),
                    PassWordSettingField(),
                    SizedBox(height: 20),
                    GetDivider(),
                    SizedBox(height: 20),
                    PasswordButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
