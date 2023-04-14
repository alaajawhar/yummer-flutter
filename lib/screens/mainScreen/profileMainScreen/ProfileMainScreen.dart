import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/services/backend/UserService.dart';
import 'package:ishop/services/modules/UserModule.dart';
import 'package:ishop/services/utils/AppUtils.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({Key? key}) : super(key: key);

  @override
  _ProfileMainScreenState createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  late Future<GetProfileResponse> getProfileResponseFuture;

  @override
  void initState() {
    getProfileResponseFuture = UserService().getProfile();
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getProfileResponseFuture,
              builder: (BuildContext context,
                  AsyncSnapshot<GetProfileResponse> snapshot) {
                return AppUtils.getWidgetFromFuture(
                  context,
                  snapshot,
                  profileScreenAppBar(
                      snapshot.data?.username, snapshot.data?.email),
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
            menuItemText(
              UIResources.ORDER_HISTORY_BUTTON,
              () {
                Navigator.of(context).pushNamed(Routes.ORDER_HISTORY);
              },
            ),
            menuItemText(
              UIResources.PAYMENT_METHOD_BUTTON,
              () {
                Navigator.of(context).pushNamed(Routes.PAYMENT_METHOD);
              },
            ),
            menuItemText(
              UIResources.MY_ADDRESS_BUTTON,
              () {
                Navigator.of(context).pushNamed(Routes.MY_ADDRESS);
              },
            ),
            menuItemText(
              UIResources.MY_PROMO_CODES_BUTTON,
              () {
                Navigator.of(context).pushNamed(Routes.MY_PROMO_CODES);
              },
            ),
            // menuItemText(
            //   UIResources.MY_FAVORITES_BUTTON,
            //   () {
            //     Navigator.of(context).pushNamed(Routes.EDIT_PROFILE);
            //   },
            // ),
            menuItemText(
              UIResources.SIGN_OUT_BUTTON,
              () {
                Navigator.of(context).pushNamed(Routes.SIGN_IN);
              },
            ),
          ],
        ));
  }

  PreferredSize profileScreenAppBar(String? username, String? email) {
    const double headerHeight = 140;
    return PreferredSize(
      preferredSize: Size.fromHeight(headerHeight),
      child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: headerHeight,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Container(
            height: 50,
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
                child: profileContainer(username, email),
              ),
            ],
          )),
    );
  }

  Widget profileContainer(String? username, String? email) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(30),
      width: double.infinity,
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.EDIT_PROFILE);
        },
        color: Colors.white,
        textColor: UIColors.TEXT_BLACK,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileImage(
                  'https://media-exp1.licdn.com/dms/image/C4E03AQEeiBxcht7eLw/profile-displayphoto-shrink_800_800/0/1578914407055?e=1651104000&v=beta&t=bDIk41w8gNFgZ1v8cCqqVmp1fx2yL6lgD-WsrKn1Ptg'),
              SizedBox(width: 20),
              usernameEmailWidget(username, email),
              editPenWidget()
            ],
          ),
        ),
      ),
    );
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
    return Icon(
      Icons.edit,
      color: Colors.black,
      size: 15,
    );
  }

  Column menuItemText(
      ProfileButton profileButton, VoidCallback callbackFunction) {
    return Column(
      children: [
        FlatButton(
          color: UIColors.MAIN_COLOR_GREY_LEVEL_1,
          textColor: UIColors.TEXT_BLACK,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: callbackFunction,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    menuItemIcon(profileButton.PREFIX_ICON),
                    SizedBox(width: 10),
                    Expanded(
                        child: Text(
                      profileButton.BUTTON_TEXT,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    )),
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
}
