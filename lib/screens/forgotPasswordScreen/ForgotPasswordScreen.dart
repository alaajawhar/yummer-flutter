import 'package:flutter/material.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/screens/commonComponents/AppButton.dart';
import 'package:ishop/screens/commonComponents/BackTitleAppBar.dart';
import 'package:ishop/screens/commonComponents/EmailTextField.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool hidePassword = true;
  bool isValidEmail = false;

  final myController = TextEditingController();

  void onListen() => setState(() {});

  @override
  void initState() {
    super.initState();
    myController.addListener(onListen);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
        appBar: BackTitleAppBar.create(true, 'Forgot Password', [], context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      UIResources.FORGOT_PASSWORD_TEXT,
                      style: TextStyle(
                          fontFamily: 'Mulish',
                          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "EMAIL",
                      style: TextStyle(
                          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                          fontSize: 12),
                    ),
                    EmailTextField(
                      textEditingController: myController,
                    ),
                    SizedBox(height: 30.0),
                    AppButton(
                      text: 'SEND',
                      onPress: () {
                        Navigator.of(context).pushNamed(Routes.CONFIRMATION_CODE);
                      },
                    ),
                  ],
                )),
          ],
        ));
  }
}
