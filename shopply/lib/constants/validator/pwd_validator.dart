//Enum Validator
enum Validation {
  atLeast,
  uppercase,
  lowercase,
  numericCharacter,
  specialCharacter,
  passwordMatch,
}

//String Validator
class StringValidation {
  static const atLeast = 'At least 8 characters';
  static const uppercase = 'At least one uppercase character';
  static const lowercase = 'At least one lowercase character';
  static const numericCharacter = 'At least one numeric character';
  static const specialCharacter = 'At least one special character';
  static const passwordMatch =
      'Your new password must be the same with y=the confirm password';
}

//Validator message
final Map<Validation, String> validatorMessage = {
  Validation.atLeast: StringValidation.atLeast,
  Validation.uppercase: StringValidation.uppercase,
  Validation.lowercase: StringValidation.lowercase,
  Validation.numericCharacter: StringValidation.numericCharacter,
  Validation.specialCharacter: StringValidation.specialCharacter,
  Validation.passwordMatch: StringValidation.passwordMatch,
};

//Validator
// ignore_for_file: prefer_interpolation_to_compose_strings

class Validator {
  //Check  minimum Length
  bool hasMinimumLength(String password, int minLength) {
    return password.length >= minLength ? true : false;
  }

  //Checks uppercaseCount
  bool hasMinimumUppercase(String password, int uppercaseCount) {
    String pattern = '^(.*?[A-Z]){$uppercaseCount,}';
    return password.contains(RegExp(pattern));
  }

  //Check lowercaseCount
  bool hasMinimumLowercase(String password, int lowercaseCount) {
    String pattern = '^(.*?[a-z]){$lowercaseCount,}';
    return password.contains(RegExp(pattern));
  }

  //Check numericCount
  bool hasMinimumNumericCharacters(String password, int numericCount) {
    String pattern = '^(.*?[0-9]){$numericCount,}';
    return password.contains(RegExp(pattern));
  }

  //Checks specialCharactersCount special character
  bool hasMinimumSpecialCharacters(
      String password, int specialCharactersCount) {
    String pattern = r"^(.*?[$&+,\:;/=?@#|'<>.^*()_%!-]){" +
        specialCharactersCount.toString() +
        ",}";

    //Checks is the passwords match
    return password.contains(
      RegExp(pattern),
    );
  }
}
