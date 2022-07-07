import 'package:caregiver_manager/configs/api.dart';
import 'package:flutter/material.dart';

class ConfirmMentor extends StatefulWidget {
  const ConfirmMentor({Key? key, @required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<ConfirmMentor> createState() => _ConfirmMentorState();
}

class _ConfirmMentorState extends State<ConfirmMentor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลพี่เลี้ยง'),
      ),
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
                    'ชื่อ ${widget.data['men_fname']} สกุล ${widget.data['men_lname']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text('อายุ xxx', style: const TextStyle(fontSize: 18)),
                  Text('ประเภทที่เลือก ${widget.data['type']}',
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
          const Text('แบบฟอร์มยืนยัน'),
          SizedBox(
            height: 80,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    confirmMentor(widget.data['men_id'], "accept", context);
                  },
                  child: Text('อนุมัติ'),
                ),
              ),
              Expanded(
                  child: TextButton(
                onPressed: () {
                  confirmMentor(widget.data['men_id'], "decline", context);
                },
                child: Text('ไม่อนุมัติ'),
              ))
            ],
          )
        ]),
      ),
    );
  }
}
