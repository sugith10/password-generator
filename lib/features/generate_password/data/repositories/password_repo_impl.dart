import 'package:password_generator/features/generate_password/data/local/password_gnerator.dart';
import 'package:password_generator/features/generate_password/domain/entities/password_settings.dart';
import 'package:password_generator/features/generate_password/domain/repositories/password_repo.dart';

class PasswordRepoImpl implements PasswordRepo {
  PasswordGenerator passwordGenerator;
  PasswordRepoImpl(this.passwordGenerator);

  @override
  String generatePassword(PasswordSettings passwordSettings) {
    return passwordGenerator.generatePassword(passwordSettings);
  }
}
