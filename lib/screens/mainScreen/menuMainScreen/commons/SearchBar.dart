import 'package:flutter/material.dart';
import 'package:ishop/constants/Routes.dart';
import 'package:ishop/constants/UIColors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Whatever You Want...',
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)
        ),
        border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)
        ),
        labelStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.normal,
            color: UIColors.MAIN_COLOR_GREY_LEVEL_1),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.filter_alt_outlined,
            color: UIColors.MAIN_COLOR_GREY_LEVEL_2,
          ),
          onPressed: ()=>{
          Navigator.of(context).pushNamed(Routes.FILTER)
          },
        ),
      ),
    );
  }
}
