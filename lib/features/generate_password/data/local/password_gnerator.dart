import 'dart:math';

import 'package:password_generator/features/generate_password/domain/entities/password_settings.dart';

class PasswordGenerator {
  final Map<String, String> _characters = {
    'lowercase': 'abcdefghijklmnopqrstuvwxyz',
    'uppercase': 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
    'numbers': '0123456789',
    'symbols': "!\$%&|[](){}:;.,*+-#@<>~"
  };

  String generatePassword(PasswordSettings passwordSettings){
    var staticPassword = "", randomPassword = "";
    if(passwordSettings.withLowercase){
      staticPassword += _characters['lowercase']!;
    }
      if(passwordSettings.withUppercase){
      staticPassword += _characters['uppercase']!;
    }
      if(passwordSettings.withNumbers){
      staticPassword += _characters['numbers']!;
    }
      if(passwordSettings.withSymbols){
      staticPassword += _characters['symbols']!;
    }
      if(passwordSettings.includeSpaces){
      staticPassword += ' $staticPassword ';
    }

    for(var i=0; i<passwordSettings.passwordLength; i++){
      var randomChar = 
      staticPassword[(Random().nextDouble() * 
      staticPassword.length).floor()];

      if(passwordSettings.excludeDuplicates){
        !randomPassword.contains(randomChar) || randomChar == " " ? randomPassword += randomChar : i--;
      }else{
        randomPassword += randomChar;
      }
    }
    return randomPassword;
  }
}
