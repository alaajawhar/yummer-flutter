import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/screens/commonComponents/AppButton.dart';
import 'package:ishop/screens/commonComponents/BackTitleAppBar.dart';
import 'package:ishop/services/backend/UserService.dart';
import 'package:ishop/services/modules/UserModule.dart';
import 'package:ishop/services/utils/AppUtils.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  _MyAddressScreenState createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  late Future<GetAddressesResponse> getAddressesFutureResponse;

  @override
  void initState() {
    getAddressesFutureResponse = UserService().getAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
      appBar: BackTitleAppBar.create(true, 'My Address', [], context),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            FutureBuilder(
                future: getAddressesFutureResponse,
                builder: (BuildContext context,
                    AsyncSnapshot<GetAddressesResponse> snapshot) {
                  return AppUtils.getWidgetFromFuture(
                    context,
                    snapshot,
                    addressesList(snapshot.data?.addresses),
                  );
                }),
            AppButton(
              text: 'ADD NEW ADDRESS',
              onPress: () {
                showBottomPopUpCard('Add New Address');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget addressesList(List<Addresses>? addresses) {
    return ListView.builder(
      itemCount: addresses?.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.ITEM_DETAILS);
          },
          child: Column(
            children: [
              addressItem('${addresses?[index].name}',
                  '${addresses?[index].state} - ${addresses?[index].province}'),
              SizedBox(
                height: 30,
              ),
            ],
          )),
    );
  }

  Widget addressItem(String title, String address) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5,
      ),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              UIResources.LOCATION_ICON,
              color: UIColors.TEXT_BLACK,
            ),
            onPressed: () => {},
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(address),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showBottomPopUpCard(String cardTitle) {
    TextEditingController titleTextEditingController = TextEditingController();
    TextEditingController newAddressTextEditingController =
        TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          alignment: Alignment.topLeft,
          height: 700,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(cardTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              titleTextForm(
                'TITLE',
                titleTextEditingController,
              ),
              newAddressTextForm(
                  'NEW ADDRESS', newAddressTextEditingController),
              AppButton(
                text: 'SAVE',
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Padding titleTextForm(
      String title, TextEditingController textEditingController) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: UIColors.MAIN_COLOR_GREY_LEVEL_2, fontSize: 12),
          ),
          TextFormField(
            controller: textEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {},
            decoration: InputDecoration(
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
      ),
    );
  }

  Padding newAddressTextForm(
      String title, TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: UIColors.MAIN_COLOR_GREY_LEVEL_2, fontSize: 12),
          ),
          TextFormField(
            controller: textEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {},
            decoration: InputDecoration(
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
      ),
    );
  }
}
