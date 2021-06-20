import 'dart:ui';

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final userAvatarUrl = '';
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountEmail: Text('longnguyen95.xn@gmail.com'),
              accountName: Text('LongNguyen'),
              currentAccountPicture: CircleAvatar(
                child: Image.asset('asserts/images/avatar.jpeg'),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          customListTile(Icons.message, Colors.white, 'Messages'),
          customListTile(Icons.account_circle, Colors.white, 'Profile')
        ],
      ),
    ));
  }
}

ListTile customListTile(IconData icon, Color? color, String title) {
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(title, style: TextStyle(color: Colors.white)),
  );
}
