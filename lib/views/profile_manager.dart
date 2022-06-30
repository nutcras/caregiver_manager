import 'package:caregiver_manager/configs/api.dart';
import 'package:flutter/material.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();

  dynamic data;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getdataprofile();
    setState(() {
      data = item;
      fname.text = data['fname'];
      lname.text = data['lname'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: fname,
              ),
              TextFormField(
                controller: lname,
              ),
            ],
          )),
    );
  }
}
