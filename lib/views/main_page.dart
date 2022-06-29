import 'package:caregiver_manager/models/sidemenu.dart';
import 'package:caregiver_manager/views/acept_mentor.dart';
import 'package:caregiver_manager/views/profile_manager.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text('ข้อมูลของพนักงาน'),
                Text('จำนวนผู้สมัคร : XX'),
                Text('จำนวนผู้ที่รอยืนยัน : XX'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const InputMentor()));
                    },
                    child: Text('xxxxxxx'))
              ],
            ),
          ),
          Container(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const Profiles()));
                },
                child: Text('ดูข้อมูลส่วนตัว')),
          )
        ],
      ),
      drawer: SideMenu(),
    );
  }
}
