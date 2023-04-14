import 'package:flutter/material.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/constants/UIResources.dart';
import 'package:ishop/services/modules/StoreModule.dart';

class PopularItemsList extends StatefulWidget {
  List<OrderList>? orderList;
  PopularItemsList(List<OrderList>? this.orderList, {Key? key}) : super(key: key);

  @override
  _PopularItemsListState createState() => _PopularItemsListState(this.orderList);
}

class _PopularItemsListState extends State<PopularItemsList> {
  List<OrderList>? orderList;
  _PopularItemsListState(List<OrderList>? orderList){
    this.orderList = orderList;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: orderList?.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.ITEM_DETAILS);
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: FadeInImage.assetNetwork(
                          placeholder: UIResources.DEFAULT_ORDER_ITEM,
                          image: '${orderList?[index].imageUrl}',
                          fadeOutDuration: const Duration(milliseconds: 10),
                          fadeInDuration: const Duration(milliseconds: 10),
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          height: 150,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${orderList?[index].name}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '${orderList?[index].category}',
                                style: TextStyle(
                                  color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '',
                                  style: TextStyle(letterSpacing: 1.0),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'price: ${orderList?[index].price}\$ - ',
                                        style: TextStyle(
                                          color: UIColors
                                              .MAIN_COLOR_GREY_LEVEL_2,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                    TextSpan(
                                        text: '${orderList?[index].discount}% discount',
                                        style: TextStyle(
                                          color: UIColors
                                              .MAIN_COLOR_ORANGE_LEVEL_2,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
