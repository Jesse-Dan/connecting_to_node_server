// ignore_for_file: library_private_types_in_public_api

import 'package:color_system/color_system.dart';
import 'package:connecting_to_react_app/ui/drawer/dictionary.dart';
import 'package:connecting_to_react_app/ui/drawer/employee.dart';
import 'package:connecting_to_react_app/ui/drawer/login.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'drawer/customers.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  /// Views to display

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      const Customers(),
      const Employee(),
      const Dictionary(),
      const Login()
    ];

    return Scaffold(
      backgroundColor: HexColor('#87c971'),
      appBar: AppBar(
        backgroundColor: HexColor('#50a832'),
        title: const Text('App'),
      ),
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            initiallyExpanded: false,
            items: const [
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Customer',
              ),
              SideNavigationBarItem(
                icon: Icons.people_rounded,
                label: 'Employees',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Dictionary',
              ),
              SideNavigationBarItem(
                icon: Icons.login,
                label: 'Login',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
