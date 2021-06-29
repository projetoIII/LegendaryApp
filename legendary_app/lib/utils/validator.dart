class Validator {
  static String? validateName({required String name}) {
    if (name.isEmpty) {
      return 'O campo Nome de Usuário não pode estar vazio';
    }

    return null;
  }

  static String? validateEmail({required String email}) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'O campo E-mail não pode estar vazio';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Formato de E-mail incorreto';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'O campo Senha não pode estar vazio';
    } else if (password.length < 6) {
      return 'A senha deve conter pelo menos 6 digitos ';
    }

    return null;
  }
}
