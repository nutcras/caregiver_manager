import 'package:flutter/material.dart';

class ConfirmMentor extends StatefulWidget {
  const ConfirmMentor({Key? key}) : super(key: key);

  @override
  State<ConfirmMentor> createState() => _ConfirmMentorState();
}

class _ConfirmMentorState extends State<ConfirmMentor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          const CircleAvatar(
            radius: 50,
          ),
          SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              color: const Color.fromARGB(255, 150, 217, 234),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'ชื่อ xxxxxxxxx สกุล xxxxxxxxx',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text('อายุ xxx', style: const TextStyle(fontSize: 18)),
                  Text('ประเภทที่เลือก xxxxxxx',
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ข้อมูลที่ส่งมา',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 20),
          const Text('ข้อมูลบัตรประชาชน'),
          SizedBox(height: 10),
          const Text('แบบฟอร์มยืนยัน')
        ]),
      ),
    );
  }
}
