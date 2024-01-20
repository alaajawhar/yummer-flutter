import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:logger/logger.dart';

import '../../../utils/AppUtils.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({Key? key}) : super(key: key);

  @override
  _ProfileMainScreenState createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  Logger LOG = AppLogger.LOGGER;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
        appBar: profileScreenAppBar('Alaa', 'alaajawhar@gmail.com',
            'https://i.pinimg.com/474x/98/51/1e/98511ee98a1930b8938e42caf0904d2d.jpg'),
        body: listMenu());
  }

  PreferredSize profileScreenAppBar(
      String? username, String? email, String profilePictureUrl) {
    double headerHeight = MediaQuery.of(context).size.height * 0.2;
    return PreferredSize(
      preferredSize: Size.fromHeight(headerHeight),
      child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: headerHeight,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Container(
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20),
            child: Text('My Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                )),
          ),
          flexibleSpace: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image(
                  image: AssetImage(UIResources.HOME_APP_BAR_BACKGROUND),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -95,
                left: 0,
                right: 0,
                child: profileContainer(username, email, profilePictureUrl),
              ),
            ],
          )),
    );
  }

  Widget profileContainer(
      String? username, String? email, String profilePictureUrl) {
    return Container(
        height: 120,
        margin: const EdgeInsets.all(30),
        width: double.infinity,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            LOG.i("TextButton has been pressed");
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            primary: UIColors.TEXT_BLACK,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profileImage(profilePictureUrl),
                SizedBox(width: 20),
                usernameEmailWidget(username, email),
                editPenWidget()
              ],
            ),
          ),
        ));
  }

  Container profileImage(String image) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: FadeInImage.assetNetwork(
          placeholder: UIResources.DEFAULT_PROFILE_PICTURE,
          image: image,
          fadeOutDuration: const Duration(milliseconds: 10),
          fadeInDuration: const Duration(milliseconds: 10),
        ),
      ),
    );
  }

  Expanded usernameEmailWidget(String? username, String? email) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${username}',
            style: TextStyle(
                fontSize: 16,
                fontFamily: UIResources.FONT,
                fontWeight: FontWeight.w600,
                color: UIColors.TEXT_BLACK),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${email}',
            style: TextStyle(
                fontSize: 14,
                fontFamily: UIResources.FONT,
                fontWeight: FontWeight.w600,
                color: UIColors.TEXT_SHADOW_COLOR),
          ),
        ],
      ),
    );
  }

  Widget editPenWidget() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Icon(
        Icons.edit,
        color: Colors.black,
        size: 15,
      ),
    );
  }

  Column menuItemText(
      ProfileButton profileButton, VoidCallback callbackFunction) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
            primary: UIColors.TEXT_BLACK,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: callbackFunction,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    menuItemIcon(profileButton.leadingIcon),
                    Expanded(
                      child: Text(
                        profileButton.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    nextArrow()
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Divider(height: 15),
        ),
      ],
    );
  }

  IconButton menuItemIcon(String iconPath) {
    return IconButton(
      icon: SvgPicture.asset(
        iconPath,
        color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
      ),
      onPressed: () => {Navigator.of(context).pushNamed(Routes.EDIT_PROFILE)},
    );
  }

  Widget nextArrow() {
    return Transform.rotate(
      angle: 180 * 3.14 / 180,
      child: IconButton(
        icon: SvgPicture.asset(
          UIResources.BACK_ARROW_ICON,
          color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
        ),
        onPressed: () => {Navigator.of(context).pushNamed(Routes.EDIT_PROFILE)},
      ),
    );
  }

  Widget listMenu() {
    return ListView(
        padding: EdgeInsets.only(top: 100),
        children: ListTile.divideTiles(
            color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
            tiles: ProfileButton.profileMenuItems.map((item) => ListTile(
                  leading: SvgPicture.asset(
                    item.leadingIcon,
                    color: UIColors.TEXT_BLACK,
                  ),
                  title: Text(item.title),
                  trailing: IconButton(
                    icon: SvgPicture.asset(
                      UIResources.NEXT_ARROW_ICON,
                      color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                    ),
                    onPressed: () {},
                  ),
                  onTap: () {
                    LOG.i('PRESSED');
                    Navigator.of(context).pushNamed(item.routeId);
                  },
                ))).toList());
  }
}
