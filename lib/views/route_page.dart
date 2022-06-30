import 'package:caregiver_manager/configs/api.dart';
import 'package:caregiver_manager/models/sidemenu.dart';
import 'package:caregiver_manager/views/acept_mentor.dart';
import 'package:caregiver_manager/views/profile_manager.dart';
import 'package:caregiver_manager/views/review/all_mentor.dart';
import 'package:flutter/material.dart';

import 'confirm_mentor.dart';
import 'home_page.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
   int _selectedIndex = 0;
   final screens = [
    MainPage(),
    InputMentor(),
    AllMentor(),
    Profiles(),
    
  ];
  final appbar = [
    'หน้าหลัก',
    'ยืนยันการสมัคร',
    'พนักงาน',
    'โปรไฟล์',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appbar[_selectedIndex])),
         body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 163, 50, 255),
        // selectedFontSize: 15,
        unselectedItemColor: Color.fromARGB(255, 80, 79, 79),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.house_outlined),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'ยืนยันการสมัคร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_reg_outlined),
            label: 'พนักงาน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'โปรไฟล์',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      drawer: SideMenu(),
    );
  }
}
