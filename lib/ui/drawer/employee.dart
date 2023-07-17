import 'package:color_system/color_system.dart';
import 'package:flutter/material.dart';

class Employee extends StatefulWidget {
  static const routeName = '/employee';
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#ffffff'),
      ),
    );
  }
}
