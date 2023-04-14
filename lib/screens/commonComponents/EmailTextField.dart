import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ishop/constants/UIColors.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  EmailTextField({Key? key,required this.textEditingController}) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState(this.textEditingController);
}

class _EmailTextFieldState extends State<EmailTextField> {
  bool isValidEmail = false;
  late TextEditingController textEditingController;

  _EmailTextFieldState(TextEditingController txtController){
    textEditingController = txtController;
  }

  @override
  Widget build(BuildContext) {
    return TextFormField(
      controller: textEditingController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        if (EmailValidator.validate(
            value == null ? "" : value) ==
            true) {
          setCheckIconVisibility(true);
        } else {
          setCheckIconVisibility(false);
        }
        textEditingController.buildTextSpan(
            context: context, withComposing: false);
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            isValidEmail ? Icons.check_outlined : null,
            color: Colors.green,
          ),
          onPressed: null,
        ),
        labelStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.normal,
            color: UIColors.MAIN_COLOR_GREY_LEVEL_1),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }

  setCheckIconVisibility(bool status) {
    isValidEmail = status;
  }
}
