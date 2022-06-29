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
      appBar: AppBar(),
     bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          NavigationDestination(
            icon: Icon(Icons.how_to_reg),
            label: 'ยืนยันการสมัคร',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          // color: Colors.red,
          alignment: Alignment.center,
          child: Column(children: [
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
                    child: Text('xxxxxxx')),
              TextButton(onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const AllMentor()));
              }, child: Text('ดูพนักงานที่ทำงานได้'))
          ]),
        ),
        
        Container(
          // color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          // color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
      drawer: SideMenu(),
    );
  }
}
