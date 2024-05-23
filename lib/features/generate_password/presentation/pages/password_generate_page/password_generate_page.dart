import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/const/constants.dart';
import '../../../data/local/password_gnerator.dart';
import '../../../data/repositories/password_repo_impl.dart';
import '../../../domain/use_cases/pasword_use_case.dart';
import '../../bloc/password_generate_bloc.dart';
import '../../widget/copy_result_container.dart';
import '../../widget/get_divider.dart';
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
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            PasswordLength(),
            Spacer(flex: 1),
            GetDivider(),
            Spacer(flex: 1),
            PassWordSettingField(),
            Spacer(flex: 1),
            GetDivider(),
            Spacer(flex: 1),
            CopyResultContainer(),
            Spacer(flex: 1),
            GetDivider(),
            Spacer(flex: 1),
            PasswordButton(),
            Spacer(flex: 3),
          ],
        ),
      )),
    );
  }
}
