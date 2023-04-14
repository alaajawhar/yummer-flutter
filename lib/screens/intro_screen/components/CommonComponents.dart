import 'package:flutter/material.dart';
import 'package:ishop/constants/UIColors.dart';

class CommonComponents {
  int index = 0;
  int numberOfDots = 0;

  List<Widget> dots(index, numberOfDots) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < numberOfDots ; i++) {
      if (i == index) {
        list.add(filledDot());
      } else {
        list.add(emptyDot());
      }
      if(i != numberOfDots - 1){
        list.add(const SizedBox(
          width: 20,
        ));
      }
    }
    return list;
  }

  Widget emptyDot() {
    return Container(
      alignment: Alignment.center,
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: UIColors.MAIN_COLOR_ORANGE_LEVEL_1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(40))
      ),
    );
  }

  Widget filledDot() {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: const BoxDecoration(
        color: UIColors.MAIN_COLOR_ORANGE_LEVEL_1,
        shape: BoxShape.circle,
      ),
    );
  }
}
