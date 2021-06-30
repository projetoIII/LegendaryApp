import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String hint,
    required FocusNode focusNode,
    required Function(String value) validator,
    this.isObscure = false,
    this.isCapitalized = false,
  })  : _emailController = controller,
        _emailFocusNode = focusNode,
        _keyboardtype = keyboardType,
        _inputAction = inputAction,
        _hint = hint,
        _validator = validator,
        super(key: key);

  final TextEditingController _emailController;
  final FocusNode _emailFocusNode;
  final TextInputType _keyboardtype;
  final TextInputAction _inputAction;
  final String _hint;
  final bool isObscure;
  final bool isCapitalized;
  final Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: _emailController,
      focusNode: _emailFocusNode,
      keyboardType: _keyboardtype,
      obscureText: isObscure,
      textCapitalization:
          isCapitalized ? TextCapitalization.words : TextCapitalization.none,
      textInputAction: _inputAction,
      cursorColor: Colors.purple,
      validator: (value) => _validator(value!),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.purple),
        hintText: _hint,
        hintStyle: TextStyle(
            fontSize: 18.0, color: Colors.purple,
        ),
        errorMaxLines: 7,
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
