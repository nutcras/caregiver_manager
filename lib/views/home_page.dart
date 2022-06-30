import 'package:caregiver_manager/models/sidemenu.dart';
import 'package:caregiver_manager/views/acept_mentor.dart';
import 'package:caregiver_manager/views/profile_manager.dart';
import 'package:caregiver_manager/views/review/all_mentor.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // color: Colors.red,
          alignment: Alignment.center,
          child: Column(children: [
            Text('ข้อมูลของพนักงาน'),
            Text('จำนวนผู้สมัคร : XX'),
            Text('จำนวนผู้ที่รอยืนยัน : XX'),
          ]),
        ),
      ),
    );
  }
}
