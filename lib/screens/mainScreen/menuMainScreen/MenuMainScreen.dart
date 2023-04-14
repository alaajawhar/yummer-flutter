import 'package:flutter/material.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/screens/mainScreen/common/PopularItemsList.dart';
import 'package:ishop/services/backend/OrderService.dart';
import 'package:ishop/services/modules/StoreModule.dart';
import 'package:ishop/services/utils/AppUtils.dart';
import 'commons/SearchBar.dart';

class MenuMainScreen extends StatefulWidget {
  const MenuMainScreen({Key? key}) : super(key: key);

  @override
  _MenuMainScreenState createState() => _MenuMainScreenState();
}

class _MenuMainScreenState extends State<MenuMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
            elevation: 0,
            title: SearchBar(),
            bottom: appBarBottom( 'Popular Orders'),
          )),
      body: Container(
        padding: EdgeInsets.all(10),
        color: UIColors.MAIN_COLOR_GREY_LEVEL_1,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder(
                  future: OrderService().getStoreOrders(),
                  builder: (BuildContext context,
                      AsyncSnapshot<GetStoreOrdersResponse> snapshot) {
                    return AppUtils.getWidgetFromFuture(context, snapshot,
                        PopularItemsList(snapshot.data?.orderList));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize appBarBottom(String text){
    return PreferredSize(
      preferredSize: Size.fromHeight(4),
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 20),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

}
