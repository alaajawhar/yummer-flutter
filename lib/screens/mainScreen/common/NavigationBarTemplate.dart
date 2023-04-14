import 'package:flutter/material.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/screens/commonComponents/IshopBottomNavigationBar.dart';
import '../homeMainScreen/HomeMainScreen.dart';
import '../OrderMainScreen/OrderMainScreen.dart';
import '../profileMainScreen/ProfileMainScreen.dart';
import '../MenuMainScreen/MenuMainScreen.dart';

class NavigationBarTemplate extends StatefulWidget {
  static const int HOME_SCREEN_ID = 0;
  static const int MENU_SCREEN_ID = 1;
  static const int ORDER_SCREEN_ID = 2;
  static const int PROFILE_SCREEN_ID = 3;

  int screenId;
  NavigationBarTemplate({Key? key, required this.screenId}) : super(key: key);

  @override
  _NavigationBarTemplateState createState() =>
      _NavigationBarTemplateState(screenId);
}

class _NavigationBarTemplateState extends State<NavigationBarTemplate> {
  late Widget displayedScreen = Scaffold();
  int selectedScreen = 0;

  _NavigationBarTemplateState(int screenId) {
    selectedScreen = screenId;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      displayedScreen = displayScreen(selectedScreen);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: IshopBottomNavigationBar(
        iconList: [
          UIResources.HOME_BOTTOM_BAR_ICON,
          UIResources.MENU_BOTTOM_BAR_ICON,
          UIResources.ORDER_BOTTOM_BAR_ICON,
          UIResources.PROFILE_BOTTOM_BAR_ICON,
        ],
        onChange: (val) {
          setState(() {
            displayedScreen = displayScreen(val);
          });
        },
        defaultSelectedIndex: 0,
      ),
      body: displayedScreen,
    );
  }

  Widget displayScreen(int screenId) {
    Widget displayedScreen = Scaffold();
    switch (screenId) {
      case NavigationBarTemplate.HOME_SCREEN_ID:
        {
          displayedScreen = HomeMainScreen();
        }
        break;
      case NavigationBarTemplate.MENU_SCREEN_ID:
        {
          displayedScreen = MenuMainScreen();
        }
        break;
      case NavigationBarTemplate.ORDER_SCREEN_ID:
        {
          displayedScreen = OrderMainScreen();
        }
        break;
      case NavigationBarTemplate.PROFILE_SCREEN_ID:
        {
          displayedScreen = ProfileMainScreen();
        }
        break;
    }
    return displayedScreen;
  }
}
