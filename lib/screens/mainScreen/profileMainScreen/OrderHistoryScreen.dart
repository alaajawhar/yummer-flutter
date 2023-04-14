import 'package:flutter/material.dart';
import 'package:ishop/constants/UIColors.dart';
class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.MAIN_COLOR_GREY_LEVEL_1,
      body: Center(child:Text('Order History Screen is under development!')),);
  }
}
