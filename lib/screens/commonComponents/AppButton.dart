import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function()? onPress;
  AppButton({Key? key, required this.text, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context, ) {
    return Container(
      height: 55,
      margin: const EdgeInsets.all(3),
      width: double.infinity,
      child: FlatButton(
        child: Text(text),
        onPressed: onPress,
        color: Colors.red,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
