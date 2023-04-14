import 'package:flutter/material.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/screens/commonComponents/AppButton.dart';
import 'package:ishop/screens/commonComponents/BackTitleAppBar.dart';
import 'package:ishop/screens/commonComponents/PasswordTextField.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
        appBar: BackTitleAppBar.create(
            true, 'Reset Password', [], context),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter new password and confirm.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      "NEW PASSWORD",
                      style: TextStyle(
                          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                          fontSize: 12),
                    ),
                    PasswordTextField(textEditingController: passwordTextController,),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "CONFIRM PASSWORD",
                      style: TextStyle(
                          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                          fontSize: 12),
                    ),
                    PasswordTextField(textEditingController: passwordTextController,),
                    SizedBox(
                      height: 25,
                    ),
                    AppButton(
                      text: 'CONFIRM PASSWORD',
                      onPress: () {
                        Navigator.of(context).pushNamed(Routes.SUCCESSFUL_RESET_PASSWORD);
                      },
                    ),
                  ],
                )
            )
        )
    );
  }
}
