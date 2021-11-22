import 'package:flutter/material.dart';

class appbar_icon extends StatelessWidget {
  final IconData iconName;
  final Function onpressed;
  appbar_icon({Key? key, required this.iconName, required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: IconButton(
            onPressed: () {
              onpressed;
            },
            icon: Icon(iconName),
            iconSize: 30,
            color: Colors.black));
  }
}
