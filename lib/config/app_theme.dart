import 'package:flutter/material.dart';


const colorList = <Color> [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.black,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink
];


class AppTheme{
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert( selectedColor >= 0, 'Selec 0' ),
      assert( selectedColor < colorList.length, 'Selec color ${ colorList.length-1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[ selectedColor]
  );
}

