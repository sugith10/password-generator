class PasswordSettings {
  final int passwordLength;
  final bool withLowercase;
  final bool withUppercase;
  final bool withSymbols;
  final bool withNumbers;
  final bool excludeDuplicates;
  final bool includeSpaces;

  PasswordSettings({
    required this.passwordLength,
    required this.withLowercase,
    required this.withUppercase,
    required this.withSymbols,
    required this.withNumbers,
    required this.excludeDuplicates,
    required this.includeSpaces,
  });
}
