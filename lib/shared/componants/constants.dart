import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 20,
    selectedItemColor: Colors.green,
    showSelectedLabels: false,
  ),
  textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )
  ),
);
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.amber,
  scaffoldBackgroundColor: HexColor('444444'),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('444444'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('444444'),
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 0.0,
    backgroundColor: HexColor('444444'),
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
    showSelectedLabels: false,
  ),
  textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )
  ),
);

String todayDate = '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';

String editDateFormat(String date) {
  var year = date.split('-')[0];
  var month = date.split('-')[1];
  var day = date.split('-')[2];
  if(month.length != 2) {
    month = '0$month';
  }
  if(day.length != 2){
    day = '0$day';
  }
  return '$year-$month-$day';
}

String editDateFormatSlash(String date) {
  var year = date.split('/')[2];
  var day = date.split('/')[1];
  var month = date.split('/')[0];
  if(month.length != 2) {
    month = '0$month';
  }
  if(day.length != 2){
    day = '0$day';
  }
  return '$year-$month-$day';
}

List<int> editStringList (List<String> list) {
  List<int> intList = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i] == '1') {
      intList.add(1);
    }else if (list[i] == '2') {
      intList.add(2);
    }else if (list[i] == '3') {
      intList.add(3);
    }else if (list[i] == '4') {
      intList.add(4);
    }else if (list[i] == '5') {
      intList.add(5);
    }else if (list[i] == '6') {
      intList.add(6);
    }
  }

  return intList;
}