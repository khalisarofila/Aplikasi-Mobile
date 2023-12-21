

import 'package:flutter/material.dart';
import 'package:taskify/calendar.dart';
import 'package:taskify/home.dart';
import 'package:taskify/profile.dart';
import 'package:taskify/task.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final pages = [Home(), Task(), Calendar(), Profile()];

  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: "TASKS",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: "CALENDAR"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_rounded), label: "PROFILE"),
        ],
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.purpleAccent,
        onTap: onTap,
      ),
    );
  }
}
