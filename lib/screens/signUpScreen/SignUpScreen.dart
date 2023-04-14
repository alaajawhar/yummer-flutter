import 'package:flutter/material.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/screens/commonComponents/AppButton.dart';
import 'package:ishop/screens/commonComponents/EmailTextField.dart';
import 'package:ishop/screens/commonComponents/PasswordTextField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hidePassword = true;
  bool isValidEmail = false;

  final NameTextController = TextEditingController();
  final EmailTextController = TextEditingController();

  void onListen() => setState(() {});

  @override
  void initState() {
    super.initState();
    NameTextController.addListener(onListen);
  }

  @override
  void dispose() {
    NameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Sign Up',
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "NAME",
                      style: TextStyle(
                          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                          fontSize: 12),
                    ),
                    EmailTextField(
                      textEditingController: NameTextController,
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "EMAIL",
                      style: TextStyle(
                          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                          fontSize: 12),
                    ),
                    EmailTextField(
                      textEditingController: EmailTextController,
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "PASSWORD",
                      style: TextStyle(
                          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                          fontSize: 12),
                    ),
                    PasswordTextField(textEditingController: NameTextController,),
                    SizedBox(height: 30.0),
                    Text(
                      "CONFIRM PASSWORD",
                      style: TextStyle(
                          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                          fontSize: 12),
                    ),
                    PasswordTextField(textEditingController: NameTextController,),
                    SizedBox(height: 30.0),
                    AppButton(
                      text: 'SIGN UP',
                      onPress: () {},
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                              color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Mulish'
                          ),
                        ),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.SIGN_IN);
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                color: UIColors.MAIN_COLOR_ORANGE_LEVEL_2,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ));
  }

  void Function()? EyeIconVisibilitySwitch() {
    return () {
      setState(() {
        hidePassword = !hidePassword;
      });
    };
  }

  setCheckIconVisibility(bool status) {
    isValidEmail = status;
  }
}

