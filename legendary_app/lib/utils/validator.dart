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
      return 'O campo E-mail não pode estar vazio.';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Formato de E-mail incorreto.';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    RegExp passwordRegExp = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$");

    if (password.isEmpty) {
      return 'O campo Senha não pode estar vazio.';
    } else if (!passwordRegExp.hasMatch(password)) {
      return 'A senha deve conter entre 8 e 10 caracteres,\ndeve conter ao menos uma letra minúscula,\ndeve conter ao menos uma letra maiúscula,\ndeve conter ao menos um caractere especial.';
    }

    return null;
  }
}
