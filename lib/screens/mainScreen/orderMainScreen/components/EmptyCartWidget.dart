import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
        body: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                UIResources.EMPTY_CART_TEXT_IMAGE.SCREEN_IMAGE,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                UIResources.EMPTY_CART_TEXT_IMAGE.SCREEN_TITLE,
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
               UIResources.EMPTY_CART_TEXT_IMAGE.SCREEN_DESCRIPTION,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: UIColors.TEXT_SHADOW_COLOR),
              ),
            ],
          ),
        ),
      )
    );
  }
}
