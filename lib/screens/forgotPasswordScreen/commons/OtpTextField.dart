import 'package:flutter/material.dart';
import 'package:ishop/constants/UIColors.dart';

class OtpTextField extends StatefulWidget {
  bool first;
  bool last;
  OtpTextField({Key? key, required this.first, required this.last}) : super(key: key);

  @override
  _OtpTextFieldState createState() => _OtpTextFieldState(this.first, this.last);
}

class _OtpTextFieldState extends State<OtpTextField> {
  bool first =false;
  bool last = false;
  bool hasText = false;
  _OtpTextFieldState(bool first, bool last){
    this.first = first;
    this.last = last;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 59,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
            sethasText(true);
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            fillColor: hasText ? UIColors.MAIN_COLOR_ORANGE_LEVEL_1 : Colors.white70, //UIColors.MAIN_COLOR_GREY_LEVEL_1,
            filled: true,
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: UIColors.MAIN_COLOR_GREY_LEVEL_1),
                borderRadius: BorderRadius.circular(6)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: UIColors.MAIN_COLOR_ORANGE_LEVEL_2),
                borderRadius: BorderRadius.circular(6)),
          ),
        ),
      ),
    );
  }

  void Function()? sethasText(bool hasText) {
      setState(() {
        this.hasText = hasText;
      });
  }
}
