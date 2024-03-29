import 'package:flutter/material.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/screens/mainScreen/common/PopularItemsList.dart';
import 'package:ishop/services/backend/OrderService.dart';
import 'package:ishop/services/backend/UserService.dart';
import 'package:ishop/services/modules/StoreModule.dart';
import 'package:ishop/services/modules/UserModule.dart';
import 'package:ishop/services/utils/AppUtils.dart';
import 'miniComponents/DeliverTo.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  late Future<GetProfileResponse> getProfileResponseFuture;

  @override
  void initState() {
    getProfileResponseFuture = UserService().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double headerHeight = 140;
    return Scaffold(
        backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
        appBar: appBar(headerHeight),
        body: Container(
          color: UIColors.MAIN_COLOR_GREY_LEVEL_1,
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hotOffers(),
                SizedBox(
                  height: 15,
                ),
                popularOrders()
              ],
            ),
          ),
        ));
  }

  SizedBox displayOfferItems(List<Offers>? offersList) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: offersList?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.OFFER_DETAILS);
          },
          child: Container(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: FadeInImage.assetNetwork(
                  placeholder: UIResources.DEFAULT_OFFER_ITEM,
                  image: '${offersList?[index].imageUrl}',
                  fadeOutDuration: const Duration(milliseconds: 10),
                  fadeInDuration: const Duration(milliseconds: 10),
                  width: 300,
                  height: 160,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget hotOffers() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hot Offers",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        FutureBuilder(
            future: OrderService().getStoreOffers(),
            builder: (BuildContext context,
                AsyncSnapshot<GetStoreOffersResponse> snapshot) {
              return AppUtils.getWidgetFromFuture(
                  context, snapshot, displayOfferItems(snapshot.data?.offers));
            }),
      ],
    );
  }

  Widget popularOrders() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Orders",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        FutureBuilder(
            future: OrderService().getStoreOrders(),
            builder: (BuildContext context,
                AsyncSnapshot<GetStoreOrdersResponse> snapshot) {
              return AppUtils.getWidgetFromFuture(context, snapshot,
                  PopularItemsList(snapshot.data?.orderList));
            }),
      ],
    );
  }

  PreferredSize appBar(double headerHeight) {
    return PreferredSize(
        preferredSize: Size.fromHeight(headerHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: headerHeight,
          backgroundColor: Colors.transparent,
          title: DeliverTo(
            state: 'Villejuif',
            province: 'Paris',
            profilePictureUrl: 'https://i.pinimg.com/474x/98/51/1e/98511ee98a1930b8938e42caf0904d2d.jpg',
          ),
          flexibleSpace: Image(
            image: AssetImage(UIResources.HOME_APP_BAR_BACKGROUND),
            fit: BoxFit.cover,
          ),
        ));
  }
}
