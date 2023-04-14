import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/screens/commonComponents/AppButton.dart';

class TextImageScreen extends StatelessWidget {
  UITextImage uiTextImage;
  String buttonText;
  TextImageScreen({Key? key, required this.uiTextImage, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
      body: Padding(
        padding: const EdgeInsets.only(
            top: 150, right: 40, left: 40, bottom: 40),
        child: Column(
          children: [
            SvgPicture.asset(
              uiTextImage.SCREEN_IMAGE,
              height: 250,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              uiTextImage.SCREEN_TITLE,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              uiTextImage.SCREEN_DESCRIPTION,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: UIColors.TEXT_SHADOW_COLOR),
            ),
            const SizedBox(
              height: 40,
            ),
            buttonText.length != 0 ? AppButton(
              text: buttonText.toUpperCase(),
              onPress: () {
                Navigator.of(context).pushNamed(Routes.HOME_NAVIGATION_BAR);
              },
            ): SizedBox(),
          ],
        ),
      ),
    );
  }
}
