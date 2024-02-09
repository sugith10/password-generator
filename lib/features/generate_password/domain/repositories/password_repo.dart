import 'package:password_generator/features/generate_password/domain/entities/password_settings.dart';

abstract class PasswordRepo{
  String generatePassword(PasswordSettings passwordSettings);
}