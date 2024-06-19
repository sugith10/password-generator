import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/const/constants.dart';
import '../../../data/local/password_gnerator.dart';
import '../../../data/repositories/password_repo_impl.dart';
import '../../../domain/use_cases/pasword_use_case.dart';
import '../../bloc/password_generate_bloc.dart';
import '../../widget/copy_result_container.dart';
import '../../widget/get_divider.dart';
import '../../widget/header.dart';
import '../../widget/password_button.dart';
import '../../widget/password_length.dart';
import '../../widget/password_settingfield.dart';

class PasswordGeneratePage extends StatelessWidget {
  const PasswordGeneratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordGenratorBloc(
        PasswordUseCase(PasswordRepoImpl(PasswordGenerator())),
      ),
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
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  AppLogo(),
                  SizedBox(height: 25),
                  GetDivider(),
                  SizedBox(height: 25),
                  PasswordLength(),
                  SizedBox(height: 25),
                  GetDivider(),
                  SizedBox(height: 25),
                  PassWordSettingField(),
                  SizedBox(height: 25),
                  GetDivider(),
                  SizedBox(height: 25),
                  CopyResultContainer(),
                  SizedBox(height: 25),
                  GetDivider(),
                  SizedBox(height: 25),
                  PasswordButton(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
