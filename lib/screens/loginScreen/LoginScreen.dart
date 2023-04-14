import 'package:flutter/material.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/screens/commonComponents/AppButton.dart';
import 'package:ishop/screens/commonComponents/EmailTextField.dart';
import 'package:ishop/screens/commonComponents/PasswordTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Sign In',
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
                      "EMAIL",
                      style: TextStyle(
                          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                          fontSize: 12),
                    ),
                    EmailTextField(
                      textEditingController: myController,
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      "PASSWORD",
                      style: TextStyle(
                          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                          fontSize: 12),
                    ),
                    PasswordTextField(textEditingController: myController,),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.FORGOT_PASSWORD);
                        },
                        child: Text('Forgot Your Password?',
                            style: TextStyle(
                                color: UIColors.MAIN_COLOR_ORANGE_LEVEL_2,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    AppButton(
                      text: 'SIGN IN',
                      onPress: () {
                        Navigator.of(context).pushNamed(Routes.HOME_NAVIGATION_BAR);
                      },
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Don’t have an account?',
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
                            Navigator.of(context).pushNamed(Routes.SIGN_UP);
                          },
                          child: Text(
                            'Sign up',
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
