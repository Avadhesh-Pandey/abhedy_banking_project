import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget{
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: kPrimaryColour,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),);
  }

}