import 'package:flutter/material.dart';

import 'components/EmptyCartWidget.dart';
class OrderMainScreen extends StatefulWidget {
  const OrderMainScreen({Key? key}) : super(key: key);

  @override
  _OrderMainScreenState createState() => _OrderMainScreenState();
}

class _OrderMainScreenState extends State<OrderMainScreen> {

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
    return EmptyCartWidget();
  }
}
