import 'package:flutter/material.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/screens/commonComponents/AppButton.dart';
import 'package:ishop/screens/commonComponents/BackTitleAppBar.dart';
import 'package:ishop/screens/forgotPasswordScreen/commons/OtpTextField.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({Key? key}) : super(key: key);

  @override
  _ConfirmationCodeScreenState createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
      appBar:
          BackTitleAppBar.create(true, 'Verify your email address', [], context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your OTP code here.",
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
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OtpTextField(first: true, last: false),
                    OtpTextField(first: false, last: false),
                    OtpTextField(first: false, last: false),
                    OtpTextField(first: false, last: false),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Didn’t receive the OTP?',
                    style: TextStyle(
                        color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Mulish'),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                    },
                    child: Text(
                      'Resend',
                      style: TextStyle(
                          color: UIColors.MAIN_COLOR_ORANGE_LEVEL_2,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              AppButton(
                text: 'VERIFY',
                onPress: () {
                  Navigator.of(context).pushNamed(Routes.RESET_PASSWORD);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
