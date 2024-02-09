part of 'password_generate_bloc.dart';

class PasswordGenratorState {
  final int passwordLength;
  final int maxPasswordLength;
  final bool isLowercase;
  final bool isUppercase;
  final bool isNumbers;
  final bool isSymbols;
  final bool isExcludeDuplicate;
  final bool isIncludeSpaces;
  final TextEditingController passwordController;

  PasswordGenratorState({
    required this.passwordLength,
    required this.maxPasswordLength,
    required this.isLowercase,
    required this.isUppercase,
    required this.isNumbers,
    required this.isSymbols,
    required this.isExcludeDuplicate,
    required this.isIncludeSpaces,
    required this.passwordController,
  });

  factory PasswordGenratorState.initial() => PasswordGenratorState(
        passwordLength: 10,
        maxPasswordLength: 26,
        isLowercase: true,
        isUppercase: false,
        isNumbers: false,
        isSymbols: false,
        isExcludeDuplicate: false,
        isIncludeSpaces: false,
        passwordController: TextEditingController(
          text: "",
        ),
      );

  PasswordGenratorState copyWith({
    int? passwordLength,
    int? maxPasswordLength,
    bool? isLowercase,
    bool? isUppercase,
    bool? isNumbers,
    bool? isSymbols,
    bool? isExcludeDuplicate,
    bool? isIncludeSpaces,
    String? password,
  }) =>
      PasswordGenratorState(
        passwordLength: passwordLength ?? this.passwordLength,
        maxPasswordLength: maxPasswordLength ?? this.maxPasswordLength,
        isLowercase: isLowercase ?? this.isLowercase,
        isUppercase: isUppercase ?? this.isUppercase,
        isNumbers: isNumbers ?? this.isNumbers,
        isSymbols: isSymbols ?? this.isSymbols,
        isExcludeDuplicate: isExcludeDuplicate ?? this.isExcludeDuplicate,
        isIncludeSpaces: isIncludeSpaces ?? this.isIncludeSpaces,
        passwordController: password != null
            ? TextEditingController(text: password)
            : passwordController,
      );
}
