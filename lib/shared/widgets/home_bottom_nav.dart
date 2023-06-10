import 'package:flutter/material.dart';
import 'package:in90/layout/cubit/cubit.dart';

Widget buildHomeBottomNav(SportCubit cubit) => BottomNavigationBar(
  currentIndex: cubit.currentIndex,
  backgroundColor: Colors.white,
  type: BottomNavigationBarType.fixed,
  selectedItemColor: Colors.green,
  elevation: 0,
  unselectedItemColor: Colors.grey,
  onTap: (index) {
    cubit.changeIndex(index);
  },
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: 'Home',),
    BottomNavigationBarItem(icon: Icon(Icons.table_rows_outlined,),label: 'Standring'),
    BottomNavigationBarItem(icon: Icon(Icons.wine_bar_outlined,),label: 'Compititions'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline,),label: 'User'),
  ],
);