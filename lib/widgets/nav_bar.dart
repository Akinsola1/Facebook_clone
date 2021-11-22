import 'package:facebook_clone/config/pallet.dart';
import 'package:facebook_clone/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class base_screen extends StatefulWidget {
  const base_screen({Key? key}) : super(key: key);

  @override
  _base_screenState createState() => _base_screenState();
}

class _base_screenState extends State<base_screen> {
  // bottom navigation bar
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home_page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Palette.facebookBlue,
          unselectedItemColor: Colors.grey,
          items: const[
            BottomNavigationBarItem(
                icon: Icon(MdiIcons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video), label: ""),
            BottomNavigationBarItem(
                icon: Icon(MdiIcons.accountCircleOutline), label: ""),
            BottomNavigationBarItem(
                icon: Icon(MdiIcons.accountGroupOutline), label: ""),
                BottomNavigationBarItem(
                icon: Icon(MdiIcons.bellOutline), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), label: ""),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}