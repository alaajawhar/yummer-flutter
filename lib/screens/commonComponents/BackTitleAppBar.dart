import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';

class BackTitleAppBar {
  // APP BAR
  static AppBar create( bool showBackArrow, String textTitle, List<Widget> actions, BuildContext context) {
    actions.add(paddingRight());
    return AppBar(
      elevation: 0,
      // backgroundColor: Colors.white24,
      backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
      title: Text(
        textTitle,
        style: TextStyle(
          color: UIColors.TEXT_BLACK,
        ),
      ),
      leading: showBackArrow ? backArrow(context) : null,
      actions: actions,
    );
  }

  static SizedBox paddingRight() {
    return const SizedBox(width: 10);
  }

  // Widgets
  static Widget backArrow(context) {
    return IconButton(
      icon: SvgPicture.asset(
        UIResources.BACK_ARROW_ICON,
        color: UIColors.MAIN_COLOR_ORANGE_LEVEL_2,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
