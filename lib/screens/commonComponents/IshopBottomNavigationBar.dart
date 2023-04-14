import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishop/constants/UIColors.dart';

class IshopBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<String> iconList;
  IshopBottomNavigationBar(
      {Key? key,
      this.defaultSelectedIndex = 2,
      required this.onChange,
      required this.iconList})
      : super(key: key);

  @override
  _IshopBottomNavigationBarState createState() =>
      _IshopBottomNavigationBarState();
}

class _IshopBottomNavigationBarState extends State<IshopBottomNavigationBar> {
  int _selectedIndex = 0;
  List<String> _iconList = [];

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(String iconPath, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / _iconList.length,
            child: SvgPicture.asset(
              iconPath,
              color: index == _selectedIndex ? UIColors.MAIN_COLOR_ORANGE_LEVEL_2: Colors.grey,
            )),
      ),
    );
  }
}
