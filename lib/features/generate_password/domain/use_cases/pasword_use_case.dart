import 'package:password_generator/core/use_case/use_case.dart';
import 'package:password_generator/features/generate_password/domain/entities/password_settings.dart';
import 'package:password_generator/features/generate_password/domain/repositories/password_repo.dart';


class PasswordUseCase implements UseCase<String, PasswordSettings> {
  final PasswordRepo passwordRepo;

  PasswordUseCase(this.passwordRepo);
  
  @override
  String call(PasswordSettings params) {
    return passwordRepo.generatePassword(params);
  }

}