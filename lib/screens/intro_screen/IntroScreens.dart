import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/screens/commonComponents/BackTitleAppBar.dart';
import 'package:ishop/screens/loginScreen/LoginScreen.dart';

import 'components/CommonComponents.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({Key? key}) : super(key: key);

  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  // Logger LOG = AppUtils.LOGGER;
  int totalNumberOfPages = 3;
  int currentPage = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
      appBar: BackTitleAppBar.create(false, '', [skipButton()], context),
      // appBar: appBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: totalNumberOfPages,
                controller: _controller,
                onPageChanged: (int index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 60, right: 40, left: 40, bottom: 40),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          UIResources.ON_BOARDING_LIST[i].SCREEN_IMAGE,
                          height: 300,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          UIResources.ON_BOARDING_LIST[i].SCREEN_TITLE,
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
                          UIResources.ON_BOARDING_LIST[i].SCREEN_DESCRIPTION,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: UIColors.TEXT_SHADOW_COLOR),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  CommonComponents().dots(currentPage, totalNumberOfPages)),
          nextButton(context, currentPage),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(229, 229, 229, 0),
      elevation: 0,
      leading: backArrow(),
      actions: [skipButton(), paddingRight()],
    );
  }

  Widget backArrow() {
    return IconButton(
      icon: SvgPicture.asset(
        UIResources.BACK_ARROW_ICON,
        color: UIColors.MAIN_COLOR_ORANGE_LEVEL_1,
      ),
      onPressed: () {},
    );
  }

  Widget skipButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: UIColors.MAIN_COLOR_ORANGE_LEVEL_1,
      ),
      onPressed: onSkipPress(),
      child: const Text('Skip'),
    );
  }

  void Function()? onSkipPress() {
    // LOG.d("Skip Button Pressed!");
    return () {
      goToLoginScreen();
    };
  }

  SizedBox paddingRight() {
    return const SizedBox(width: 10);
  }

  Function()? onPressed(context, index) {
    return () {
      if (index == totalNumberOfPages - 1) {
        goToLoginScreen();
        // LOG.d("Let's Start Button Pressed!");
      }
      _controller.nextPage(
          duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
      // LOG.d("Next Button Pressed!");
    };
  }

  void goToLoginScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (buildContext) => LoginScreen()));
  }

  Container nextButton(context, index) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(40),
      width: double.infinity,
      child: TextButton(
        onPressed: () => onPressed(context, index),
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(index == totalNumberOfPages - 1 ? "LET'S START" : "NEXT"),
      ),
    );
  }
}
