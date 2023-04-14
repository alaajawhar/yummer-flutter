import 'package:flutter/material.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';
import 'package:ishop/screens/commonComponents/AppButton.dart';
import 'package:ishop/screens/commonComponents/BackTitleAppBar.dart';
import 'package:ishop/services/backend/OrderService.dart';
import 'package:ishop/services/modules/StoreModule.dart';
import 'package:ishop/services/utils/AppUtils.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late Future<GetFiltersResponse> getFiltersResponseFuture;
  int indexOfSortingBy = 0;
  List<String> orderBySelectedList = [];

  @override
  void initState() {
    super.initState();
    getFiltersResponseFuture = OrderService().getFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
      appBar: BackTitleAppBar.create(true, 'Filter', [], context),
      body: Container(
        padding: EdgeInsets.all(25),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            filterName('Sort By'),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
                future: getFiltersResponseFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<GetFiltersResponse> snapshot) {
                  return AppUtils.getWidgetFromFuture(
                      context, snapshot, orderSelection(snapshot.data?.order));
                }),
            filterName('Category'),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
                future: getFiltersResponseFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<GetFiltersResponse> snapshot) {
                  return AppUtils.getWidgetFromFuture(context, snapshot,
                      categorySelection(snapshot.data?.category));
                }),
            AppButton(
              text: 'APPLY',
              onPress: () {
                Navigator.of(context)
                    .pushNamed(Routes.MENU_NAVIGATION_BAR);
              },
            ),
          ],
        ),
      ),
    );
  }

  Text filterName(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  Widget orderSelection(List<Order>? filterChild) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ListView.builder(
          itemCount: filterChild?.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: true,
            autofocus: false,
            showCursor: false,
            initialValue: filterChild?[index].description,
            enableInteractiveSelection: false,
            onTap: () {
              setState(() {
                indexOfSortingBy = index;
              });
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  indexOfSortingBy == index ? Icons.check_outlined : null,
                  color: Colors.green,
                ),
                onPressed: () {},
              ),
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w600,
                  color: UIColors.MAIN_COLOR_GREY_LEVEL_2),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: UIColors.MAIN_COLOR_GREY_LEVEL_2)),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: UIColors.MAIN_COLOR_GREY_LEVEL_2)),
            ),
          ),
        ));
  }

  Widget categorySelection(List<Category>? categoryChild) {
    int? totalListSize = categoryChild?.length;

    // JUST TO AVOID NULL POINTER EXCEPTION
    if(totalListSize == null){
      return SizedBox();
    }

    // FIRST COLUMN
    int firstColumnRowsNumber = 0;
    if (totalListSize % 2 == 0) {
      firstColumnRowsNumber = (totalListSize / 2).round();
    } else {
      firstColumnRowsNumber = ((totalListSize - 1) / 2).round();
    }
    int firstColumnEndIndex = firstColumnRowsNumber;
    List<Category>? firstCategoryChild =
        categoryChild?.sublist(0, firstColumnEndIndex);

    // SECOND COLUMN
    int secondColumnRowsNumber = 0;
    firstColumnRowsNumber = totalListSize - (totalListSize / 2).round();
    int secondColumnEndIndex = totalListSize - secondColumnRowsNumber;
    List<Category>? secondCategoryChild =
        categoryChild?.sublist(firstColumnEndIndex, secondColumnEndIndex);

    return Row(
      children: [
        Expanded(
          child: Container(
            width: 160,
            child: ListView.builder(
                itemCount: firstCategoryChild?.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    categoryCheckBox(firstCategoryChild![index])),
          ),
        ),
        Expanded(
          child: Container(
            width: 160,
            child: ListView.builder(
                itemCount: secondCategoryChild?.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index1) =>
                    categoryCheckBox(secondCategoryChild![index1])),
          ),
        )
      ],
    );
  }

  Widget categoryCheckBox(Category categoryChild) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          focusColor: Colors.white,
          activeColor: UIColors.MAIN_COLOR_ORANGE_LEVEL_2,
          value: orderBySelectedList.contains('${categoryChild.id}'),
          onChanged: (checkboxValue) {
            setState(() {
              if (checkboxValue != null && checkboxValue == true) {
                orderBySelectedList.add('${categoryChild.id}');
              }

              if (checkboxValue != null && checkboxValue == false) {
                orderBySelectedList.remove('${categoryChild.id}');
              }

              print(orderBySelectedList);
            });
          },
        ),
        Expanded(
          child: Text(
            '${categoryChild.description}',
            style: TextStyle(
              color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
