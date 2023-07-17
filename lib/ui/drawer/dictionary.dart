import 'package:color_system/color_system.dart';
import 'package:flutter/material.dart';

class Dictionary extends StatefulWidget {
  static const routeName = '/dictionary';
  const Dictionary({super.key});

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#ffffff'),
      ),
    );
  }
}
