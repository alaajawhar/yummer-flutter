import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';

class DeliverTo extends StatefulWidget {
  String? profilePic;
  String? province;
  String? state;
  DeliverTo(
      {Key? key,
      required this.province,
      required this.state,
      required this.profilePic})
      : super(key: key);

  @override
  _DeliverToState createState() =>
      _DeliverToState(this.province, this.state, this.profilePic);
}

class _DeliverToState extends State<DeliverTo> {
  String? province = '';
  String? state = '';
  String? profilePic = '';

  _DeliverToState(String? province, String? state, String? this.profilePic) {
    this.state = state;
    this.province = province;
    this.profilePic = profilePic;
  }

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
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: FadeInImage.assetNetwork(
                placeholder: UIResources.DEFAULT_PROFILE_PICTURE,
                image: '${profilePic}',
                fadeOutDuration: const Duration(milliseconds: 10),
                fadeInDuration: const Duration(milliseconds: 10),
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deliver To:',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: UIResources.FONT,
                    fontWeight: FontWeight.w600,
                    color: UIColors.MAIN_COLOR_GREY_LEVEL_1),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${province} - ${state}',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: UIResources.FONT,
                    fontWeight: FontWeight.w600,
                    color: UIColors.MAIN_COLOR_GREY_LEVEL_1),
              ),
            ],
          ),
          Spacer(),
          nextArrow()
        ],
      ),
    );
  }

  Widget nextArrow() {
    return Transform.rotate(
      angle: 180 * 3.14 / 180,
      child: IconButton(
        icon: SvgPicture.asset(
          UIResources.BACK_ARROW_ICON,
          color: UIColors.MAIN_COLOR_GREY_LEVEL_1,
        ),
        onPressed: () => {Navigator.of(context).pushNamed(Routes.EDIT_PROFILE)},
      ),
    );
  }
}
