import 'package:flutter/material.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/screens/commonComponents/BackTitleAppBar.dart';
import 'package:ishop/services/backend/OrderService.dart';
import 'package:ishop/services/modules/StoreModule.dart';
import 'package:ishop/services/utils/AppUtils.dart';

class MyPromoCodesScreen extends StatefulWidget {
  const MyPromoCodesScreen({Key? key}) : super(key: key);

  @override
  _MyPromoCodesScreenState createState() => _MyPromoCodesScreenState();
}

class _MyPromoCodesScreenState extends State<MyPromoCodesScreen> {
  static bool CURRENT_BOOL = true;
  static bool USED_BOOL = false;

  List<bool> isSelected = [];
  late Future<GetPromocodesResponse> getPromocodesResponseFuture;
  @override
  void initState() {
    super.initState();
    isSelected = [CURRENT_BOOL, USED_BOOL];
    getPromocodesResponseFuture = OrderService().getPromoCodes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
      appBar: BackTitleAppBar.create(true, 'My PromoCodes', [], context),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customToggle('Current', 'Used'),
            promoCodeListBuilder(getPromocodesResponseFuture)
          ],
        ),
      ),
    );
  }

  ToggleButtons customToggle(String toggle1, String toggle2) {
    return ToggleButtons(
      selectedColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
      disabledColor: UIColors.MAIN_COLOR_GREY_LEVEL_2,
      fillColor: UIColors.MAIN_COLOR_ORANGE_LEVEL_1,
      borderRadius: BorderRadius.circular(10.0),
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            toggle1,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            toggle2,
          ),
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
      },
      isSelected: isSelected,
    );
  }

  Widget promoCodeListBuilder(
      Future<GetPromocodesResponse> getPromocodesResponseFuture) {
    return FutureBuilder(
        future: getPromocodesResponseFuture,
        builder: (BuildContext context,
            AsyncSnapshot<GetPromocodesResponse> snapshot) {
          return AppUtils.getWidgetFromFuture(
              context,
              snapshot,
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  promoCodeList(snapshot.data?.promocodes),
                ],
              ));
        });
  }

  Widget promoCodeList(List<Promocodes>? promocodes) {
    return Padding(
        padding: const EdgeInsets.only(left: 25),
        child: ListView.builder(
          itemCount: promocodes?.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.ITEM_DETAILS);
              },
              child: isSelected[0] == CURRENT_BOOL
                  ? currentPromoCodeItem(promocodes, index)
                  : expiredPromoCodeItem(promocodes, index)),
        ));
  }

  Widget currentPromoCodeItem(List<Promocodes>? promocodes, int index) {
    if (promocodes?[index].expiryDate != null) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
          promocodes![index].expiryDate! * 1000);

      if (date.isBefore(DateTime.now())) {
        return SizedBox();
      }
    }
    return Column(
      children: [
        Row(
          children: [
            promoCodeImage('${promocodes?[index].imageUrl}'),
            promoCodeText(
                promocodes?[index].value,
                promocodes?[index].description,
                DateTime.fromMillisecondsSinceEpoch(
                    promocodes![index].expiryDate! * 1000)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Divider(height: 10),
        ),
      ],
    );
  }

  Widget expiredPromoCodeItem(List<Promocodes>? promocodes, int index) {
    if (promocodes?[index].expiryDate != null) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
          promocodes![index].expiryDate! * 1000);

      if (date.isAfter(DateTime.now())) {
        return SizedBox();
      }
    }
    return Column(
      children: [
        Row(
          children: [
            promoCodeImage('${promocodes?[index].imageUrl}'),
            promoCodeText(
                promocodes?[index].value,
                promocodes?[index].description,
                DateTime.fromMillisecondsSinceEpoch(
                    promocodes![index].expiryDate! * 1000)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Divider(height: 10),
        ),
      ],
    );
  }

  Widget promoCodeText(String? promoCode, String? discount, DateTime date) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${promoCode}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Text(
              '${discount}',
              style: TextStyle(
                color: UIColors.MAIN_COLOR_ORANGE_LEVEL_2,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
                style: TextStyle(
                  color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                )),
          ],
        ),
      ),
    );
  }

  Widget promoCodeImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: FadeInImage.assetNetwork(
        placeholder: UIResources.DEFAULT_OFFER_ITEM,
        image: '${imageUrl}',
        fadeOutDuration: const Duration(milliseconds: 10),
        fadeInDuration: const Duration(milliseconds: 10),
        width: 80,
        height: 80,
      ),
    );
  }
}
