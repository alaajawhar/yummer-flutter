import 'package:flutter/material.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/screens/commonComponents/TextImageScreen.dart';

class SuccessfulResetPasswordScreen extends StatelessWidget {
  const SuccessfulResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextImageScreen(
        uiTextImage: UIResources.SUCCESSFUL_RESET_PASSWORD_TEXT_IMAGE,
        buttonText: 'DONE');
  }
}
