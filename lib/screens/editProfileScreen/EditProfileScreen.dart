import 'package:flutter/material.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/screens/commonComponents/AppButton.dart';
import 'package:ishop/screens/commonComponents/BackTitleAppBar.dart';
import 'package:ishop/services/backend/UserService.dart';
import 'package:ishop/services/modules/UserModule.dart';
import 'package:ishop/services/utils/AppUtils.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late Future<GetProfileResponse> getProfileResponseFuture;

  final NameTextController = TextEditingController();
  void onListen() => setState(() {});

  @override
  void initState() {
    getProfileResponseFuture = UserService().getProfile();
    NameTextController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    NameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
        appBar: BackTitleAppBar.create(true, 'Edit Profile', [], context),
        body: FutureBuilder(
            future: getProfileResponseFuture,
            builder: (BuildContext context,
                AsyncSnapshot<GetProfileResponse> snapshot) {
              return AppUtils.getWidgetFromFuture(
                  context,
                  snapshot,
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        profileWidget(snapshot.data?.profilePicture),
                        SizedBox(height: 30.0),
                        labelText('NAME', snapshot.data?.username),
                        SizedBox(height: 30.0),
                        labelText('EMAIL', snapshot.data?.email),
                        SizedBox(height: 30.0),
                        labelText('PHONE NUMBER', snapshot.data?.phone),
                        SizedBox(height: 30.0),
                        labelText('LOCATION',
                            '${snapshot.data?.address?.state} - ${snapshot.data?.address?.province}'),
                        SizedBox(height: 30.0),
                        AppButton(
                          text: 'SAVE CHANGES',
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ));
            }));
  }

  Stack profileWidget(String? profilePicture){
    return Stack(children: [
      Container(
        width: 130.0,
        height: 130.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70.0),
          child: FadeInImage.assetNetwork(
            placeholder:
            UIResources.DEFAULT_PROFILE_PICTURE,
            image: '${profilePicture}',
            fadeOutDuration:
            const Duration(milliseconds: 10),
            fadeInDuration:
            const Duration(milliseconds: 10),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 4,
        child: buildEditIcon(UIColors.MAIN_COLOR_ORANGE_LEVEL_1),
      ),
    ]);
  }

  Widget labelText(String labelName, String? initialValue) {
    final myController = TextEditingController(text: initialValue);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style:
              TextStyle(color: UIColors.MAIN_COLOR_GREY_LEVEL_2, fontSize: 12),
        ),
        TextFormField(
          controller: myController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // initialValue: 'initialValue',
          onChanged: (value) {},
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                Icons.check_outlined,
                color: Colors.green,
              ),
              onPressed: null,
            ),
            labelStyle: TextStyle(
                fontSize: 12,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.normal,
                color: UIColors.MAIN_COLOR_GREY_LEVEL_1),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
          ),
        ),
      ],
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 15,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
