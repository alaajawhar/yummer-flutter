import 'package:flutter/material.dart';
import 'package:ishop/constants/UIColors.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  const PasswordTextField({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  _PasswordTextFieldState createState() =>
      _PasswordTextFieldState(textEditingController);
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool hidePassword = true;
  late TextEditingController textEditingController;

  _PasswordTextFieldState(TextEditingController txtController) {
    textEditingController = txtController;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              hidePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
            ),
            onPressed: EyeIconVisibilitySwitch(),
          ),
          labelStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.normal,
              color: UIColors.MAIN_COLOR_GREY_LEVEL_1),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
      obscureText: hidePassword,
    );
  }

  void Function()? EyeIconVisibilitySwitch() {
    return () {
      setState(() {
        hidePassword = !hidePassword;
      });
    };
  }
}
